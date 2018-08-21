const deleteLastSlash = (req, res, next) => {
	req.url = req.path !== '/' && req.path.trim().substr(-1) === '/' ? req.path.slice(0, -1) : req.path;
	next();
}

const getRoute = (url) => {

	const routesList = exports.data.routesList;

	return new Promise((resolve, reject) => {

		const result = {
			route: false,
			routeParams: false
		};

		routesList.some(route => {
			const urlExec = new RegExp(`^${route.url}$`).exec(url);

			if (urlExec !== null) {
				result.route = route;
				result.routeParams = urlExec.slice(1);
				return true;
			}
		})

		return resolve(result);
	})
}
const getRouteByAlias = (url) => {

	const aliasesObj = exports.data.aliasesObj;
	const routesObj = exports.data.routesObj;

	return new Promise((resolve, reject) => {
		const result = {
			route: false,
			routeParams: false
		}

		if (url in aliasesObj) {
			const alias = aliasesObj[url];
			result.route = routesObj[alias.route_url];
			result.routeParams = alias.params.split(',');
		}

		return resolve(result);
	})
}

const replaceParams = (route) => {
	route.url = route.url.replace(/:params/g, '([a-zA-Z0-9\-]+)');
	return route;
}

const { createVisitor } = require('./visitors');
const { createVisit } = require('./visits');
const { createView } = require('./views');
const { constructHeaderRows } = require('./header-nav');

exports.data = {};

exports.setupRoutesList = ({ routesList, aliasesList }) => {

	const routesObj = routesList.reduce((general, current) => {
		general[current.url] = current;
		return general;
	}, {});

	routesList = routesList.map(replaceParams);

	const aliasesObj = aliasesList.reduce((general, current) => {
		general[current.alias] = current;
		return general;
	}, {});

	exports.data.aliasesObj = aliasesObj;
	exports.data.routesObj = routesObj;
	exports.data.routesList = routesList;
}


module.exports.Router = async (app) => {

	const { Model } = app;

	const Router = app.express.Router();
	const fragmentsHandler = require('./fragments')(app);

	var [error, routesList] = await app.db.execQuery(`SELECT r.*, t.name as template_name FROM routes r LEFT JOIN templates t ON t.id = r.template_id ORDER BY dynamic`);
	var [error, aliasesList] = await app.db.execQuery(`SELECT a.*, r.url as route_url FROM routes_aliases a LEFT JOIN routes r ON r.id = a.route_id`);

	routesList = routesList || [];
	aliasesList = aliasesList || [];

	exports.setupRoutesList({ routesList, aliasesList });

	Router.use(deleteLastSlash);
	Router.use(constructHeaderRows);

	Router.get('*', createVisitor);
	Router.get('*', createVisit);
	Router.get('*', createView);

	Router.get('*', async (req, res, next) => {
		try {
			const getRouteQuery = getRoute(req.url);
			const getRouteByAliasQuery = getRouteByAlias(req.url);

			const [byUrl, byAlias] = await Promise.all([getRouteQuery, getRouteByAliasQuery]);

			const { route, routeParams } = byUrl.route ? byUrl : byAlias;

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
			res.locals.session = req.session;
			res.locals.reqQuery = req.query;
			res.locals.dynamicRouteNumber = routeParams[0] || false;
			res.locals.fullUrl = req.url;

			const fragmentsMap = fragments.map(async fragment => {
				return fragmentsHandler(fragment, { session: Object.assign({}, req.session), locals: Object.assign({}, res.locals) });
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