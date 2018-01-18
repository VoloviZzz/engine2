const { Model } = require('../models/index');

module.exports = (app, express) => {

    const Router = app.express.Router();
    const fragmentsHandler = require('./fragments')(app);

    Router.get('*', (req, res, next) => {

        req.locals = {};

        const routesObj = app.locals.routesList;
        const reqUrl = req.url;
        let routeSplit, route;

        route = routesObj[reqUrl];
        
        if (reqUrl !== '/') {
            
            routeSplit = reqUrl.split('/').filter((r) => r !== '');
            
            if (!!routesObj[`/${routeSplit[0]}`] === false) {
                const err = new Error('Маршрут не найден');
                err.status = 404;
                
                return next(err);
            }
            
            route = routesObj[`/${routeSplit[0]}`];
        }
        else {
            if (!!routesObj[`/`] === false) {
                const err = new Error('Маршрут не найден');
                err.status = 404;
                
                return next(err);
            }
        }
        
        req.locals.route = route;

        return next();
    }, (req, res, next) => {

        if (req.locals.route.access == "2" && !!req.session.user.id == false) {
            const err = new Error('Нет доступа к странице');
            err.status = 503;
            return next(err);
        }

        if (req.locals.route.access == "3" && !!req.session.user.admin === false) {
            const err = new Error('Нет доступа к странице');
            err.status = 503;
            return next(err);
        }

        return next();
    }, (req, res, next) => {
        const route = req.locals.route;

        const urlSplit = req.url.split('/').filter((r) => r !== '');
        const urlLength = urlSplit.length;

        if (!!route.dynamic === true && urlLength < 2) {
            const error = new Error();
            return next({ status: '502', message: 'Нет параметра для динамического маршрута' });
        }
        else if (!!route.dynamic === false && urlLength > 1) {
            return next({ status: 'bad', message: 'Неверный маршрут', httpCode: 502 });
        }

        const routeParam = urlSplit[1];

        return next();
    }, async (req, res, next) => {
        // получение фрагментов
        let err = false;
        const route = req.locals.route;

        res.locals.routeName = route.name;

        res.locals.user = {
            admin: req.session.user.admin,
            adminMode: req.session.user.adminMode
        };

        res.locals.routeId = route.id;
        res.locals.page = route.name;

        // [err, fragments] = await getFragments({ route_id: route.id });
        [err, fragments] = await Model.fragments.get({route_id: route.id});
        if (err) return next(err);

        const fragmentsMap = fragments.map(fragment => {
            return fragmentsHandler(fragment, { req, locals: res.locals })
        });

        const fragmentsData = await Promise.all(fragmentsMap);
        res.locals.fragmentsData = fragmentsData;

        next();
    }, (req, res, next) => {

        const viewsData = {
            user: req.session.user,
            page: req.locals.route.name,
        };

        Object.assign(viewsData, req.locals.route);

        return res.render(req.locals.route.template_name, viewsData);
    })

    let apiControllers = require('require-dir')('../api');

    Router.post(['/api/:ctrl', '/api/:ctrl/:action'], async (req, res, next) => {
        let {ctrl, action} = req.params;
        action = action || ctrl;

        if(!!apiControllers[ctrl] === false) return res.json({status: 'bad', message: 'Контроллер не найден'})
        
        const routeController = apiControllers[ctrl];


		if(routeController[action]) {
			const controllerAction = routeController[action];

			const controllerResult = await controllerAction(req, res, next);

			const referer = req.header('Referer');
			if (req.xhr) res.json(controllerResult)
			else res.redirect(referer);
		}
		else {
			res.json({status: 'bad', message: 'Действие не найдено'})
		}
    })

    return Router;
}