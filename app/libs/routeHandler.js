const deleteLastSlash = (req, res, next) => {
	req.url = req.url !== '/' && req.url.trim().substr(-1) === '/' ? req.url.slice(0, -1) : req.url;
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
	route.url = route.url.replace(/:params/g, '([a-zA-Z1-9\-]+)');
	return route;
}

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


module.exports.Router = (app) => {

	const { Model } = app;

	const Router = app.express.Router();
	const fragmentsHandler = require('./fragments')(app);

	Router.use(deleteLastSlash);

	Router.get('*', async (req, res, next) => {
		try {
			const getRouteQuery = getRoute(req.url);
			const getRouteByAliasQuery = getRouteByAlias(req.url);

			const [byUrl, byAlias] = await Promise.all([getRouteQuery, getRouteByAliasQuery]);

			const { route, routeParams } = byUrl.route ? byUrl : byAlias;

			if (!!route === false) return next({ message: 'Страница не найдена', status: '404' });

			const getFragmentsParams = {
				route_id: route.id
			};

			if (req.session.user.adminMode === false) {
				getFragmentsParams.public = '1';
			}

			var [err, fragments] = await Model.fragments.get(getFragmentsParams);
			if (err) return next(err);

			console.log(fragments);

			res.locals.routeId = route.id;
			
			const fragmentsMap = fragments.map(async fragment => {
				return fragmentsHandler(fragment, { session: Object.assign({}, req.session), locals: Object.assign({}, res.locals) });
			});
			
			const fragmentsData = await Promise.all(fragmentsMap);
			
			res.locals.fragmentsData = fragmentsData;

			const viewsData = {
				route: { ...route },
				session: { ...req.session },
			};

			return res.render(route.template_name, viewsData);
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