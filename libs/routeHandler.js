module.exports = (app, express) => {

    const Router = app.express.Router();
    const { getFragments, fragmentsHandler } = require('./fragments')(app);

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

        req.locals.route = route;

        return next();
    }, (req, res, next) => {

        if (!!req.locals.route.public === false && !!req.session.user.id == false) {
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
            return next({ status: 'bad', message: 'Нет параметра для динамического маршрута' });
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

        [err, fragments] = await getFragments({ route_id: route.id });
        if (err) return next(err);

        const fragmentsMap = fragments.map(fragment => {
            return fragmentsHandler(fragment, { req })
        });

        const fragmentsData = await Promise.all(fragmentsMap);

        res.locals.routeName = route.name;
        res.locals.fragmentsData = fragmentsData;
        res.locals.user = {
            admin: req.session.user.admin,
            adminMode: req.session.user.adminMode
        };
        res.locals.routeId = route.id;

        next();
    }, (req, res, next) => {
        
        const viewsData = {
            user: req.session.user,
            page: req.locals.route.name,
        };

        Object.assign(viewsData, req.locals.route);

        return res.render(req.locals.route.template_name,viewsData);
    })

    Router.post('*', async (req, res, next) => {
        req.locals = {};

        const postRoutes = app.locals.postRoutes;
        const reqUrl = req.url;
        let err = false;
        
        if(!!postRoutes[reqUrl] === false) return next(new Error("Маршрут не найден"));

        const postHandler = postRoutes[reqUrl];
        
        [err, postResult] = await postHandler(req.body);
        
        if(err) {
            err = new Error(err.message);
            return next(new Error(err));
        }

        res.json({status: 'ok'})
    });

    return Router;
}