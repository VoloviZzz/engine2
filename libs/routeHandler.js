module.exports = (app, express) => {

    const data = { // хранилище данных
        views: {}, // данные для передачи в шаблон
        ctrl: {} // данные для работы внутри контроллера
    };

    const Router = express.Router();
    const { getFragments, fragmentsHandler } = require('./fragments')(app);

    Router.get('*', (req, res, next) => {
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
        
        data.ctrl.route = route;
        
        return next();
    }, (req, res, next) => {

        if (!!data.ctrl.route.public === false && !!req.session.user.id == false) {
            const err = new Error('Нет доступа к странице');
            err.status = 503;
            return next(err);
        }

        return next();
    }, (req, res, next) => {
        const route = data.ctrl.route;

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
        const route = data.ctrl.route;
        
        [err, fragments] = await getFragments({route_id: route.id});
        if(err) return next(err);

        const fragmentsMap = fragments.map(fragment => {
            return fragmentsHandler(fragment, {req, res, next})
        });

        const fragmentsData = await Promise.all(fragmentsMap);

        data.views.fragmentsData = fragmentsData;

        next();
    }, (req, res, next) => {
        return res.render('index', data.views);
    })

    return Router;
}