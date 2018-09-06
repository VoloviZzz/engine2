const storage = require('../storage');
const Model = require('../models');

const deleteLastSlash = (req, res, next) => {
	req.url = req.path !== '/' && req.path.trim().substr(-1) === '/' ? req.path.slice(0, -1) : req.path;
	next();
}

const replaceParams = (route) => {
	route.url = route.url.replace(/:params/g, '([a-zA-Z0-9\-]+)');
	return route;
}

const getRoute = (url) => {

	const routesMap = storage.get('routesMap');

	return new Promise((resolve, reject) => {

		const result = {
			route: false,
			routeParams: false
		};

		Object.values(routesMap).some(route => {
			route = replaceParams(route);
			const urlExec = new RegExp(`^${route.url}$`).exec(url);

			if (urlExec !== null) {
				if (route.alias) {

					const alias = routesMap[url];

					alias.route_url = alias.route_url.replace(/:params/g, '([a-zA-Z0-9\-]+)');
					result.route = routesMap[alias.route_url];
					result.routeParams = alias.params.split(',');
				} else {
					result.route = route;
					result.routeParams = urlExec.slice(1);
				}

				return true;
			}
		});

		return resolve(result);
	})
}
const { createVisitor } = require('./visitors');
const { createVisit } = require('./visits');
const { createView } = require('./views');
const { constructHeaderRows } = require('./header-nav');

const initRoutesList = async () => {

	const routesMap = {};

	var [error, routesList] = await Model.routes.get();
	var [error, aliasesList] = await Model.aliases.get();

	[...routesList, ...aliasesList].reduce((object, item) => {
		object[item.url] = item;
		return object;
	}, routesMap);

	storage.set(`routesMap`, routesMap);
}


module.exports.Router = async (app) => {

	const Router = app.express.Router();
	const fragmentsHandler = require('./fragments')(app);

	await initRoutesList();

	Router.use(deleteLastSlash);
	Router.use(constructHeaderRows);
	Router.use((req, res, next) => {
		res.locals.session = req.session;
		res.locals.reqQuery = req.query;
		next();
	});

	Router.get('*', createVisitor);
	Router.get('*', createVisit);
	Router.get('*', createView);

	Router.get('*', async (req, res, next) => {
		try {
			const findRoute = await getRoute(req.url);
			const { route, routeParams } = findRoute;

			if (!!route === false) return next({ message: 'Страница не найдена', status: '404' });

			if (route.access == "2" && !!req.session.user.id == false) {
				const err = new Error('Нет доступа к странице');
				err.status = 503;
				return next(err);
			}

			if (route.access == "3" && !!req.session.user.admin === false) {
				const err = new Error('Нет доступа к странице');
				err.status = 503;
				return next(err);
			}

			const getFragmentsParams = {
				route_id: route.id
			};

			if (req.session.user.adminMode === false) {
				getFragmentsParams.public = '1';
			}

			var [err, fragments] = await Model.fragments.get(getFragmentsParams);
			if (err) return next(err);

			res.locals.route = route;
			res.locals.dynamicRouteNumber = routeParams[0] || false;
			res.locals.fullUrl = req.url;

			const fragmentsMap = fragments.map(async fragment => {
				return fragmentsHandler(fragment, { session: { ...req.session }, locals: { ...res.locals } });
			});

			const fragmentsData = await Promise.all(fragmentsMap);

			res.locals.fragmentsData = fragmentsData;

			return res.render(route.template_name);
		} catch (error) {
			next(error);
		}
	})

	let apiControllers = require('require-dir')('../api');

	Router.post(['/api/:ctrl', '/api/:ctrl/:action'], async (req, res, next) => {
		let { ctrl, action } = req.params;
		action = action || ctrl;

		if (!!apiControllers[ctrl] === false) return res.json({ status: 'bad', message: 'Контроллер не найден' })

		const routeController = apiControllers[ctrl];

		if (routeController[action]) {
			const controllerAction = routeController[action];

			const controllerResult = await controllerAction(req, res, next);

			if (!!controllerResult === true && 'sendData' in controllerResult) {
				return res.send(controllerResult.sendData)
			}
			else {
				res.json(controllerResult)
			}
			// else if (req.xhr === true) {
			// 	res.json(controllerResult)
			// } 
			// else {
			// 	var backUrl = urlLib.parse(req.header('Referer')).pathname;
			// 	return res.redirect(backUrl);
			// }
		}
		else {
			res.json({ status: 'bad', message: 'Действие не найдено' })
		}
	})

	return Router;
}