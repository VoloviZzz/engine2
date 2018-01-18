const { Model } = require('../models');
const { initRoutes } = require('../libs/router');

exports.add = async function (req, res, next) {
	
	if(req.app.locals.routesList[req.body.url]) {
		return {status: 'bad', message: 'Маршрут с таким URL уже есть в списке'};
	}

    const [err, route] = await Model.routes.add(req.body);

    if (err) return { status: 'bad', message: err.message, error: err };

    req.app.locals.routesList[route.url] = route;

    return { status: 'ok' };
}

exports.del = async function (req, res, next) {
    const routeId = req.body.id;
    let error = false;

    if (!!routeId === false) return { status: 'bad', message: 'Нет параметра routeId' };

    [error, route] = await req.app.Model.routes.get({ id: routeId });
    if (error) return { status: 'bad', message: err.message, error };
    if (!!route === false) return { status: 'bad', message: 'Ошибка получения маршрута' };

    [error, rows] = await Model.routes.del(req.body);
    if (error) return { status: 'bad', message: err.message, error };

    delete req.app.locals.routesList[route.url];

    return { status: 'ok' };
}

exports.upd = async function (req, res, next) {
    const routeId = req.body.id;
    let error = false;

    if (!!routeId === false) return { status: 'bad', message: 'Нет параметра routeId' };

    [error, route] = await Model.routes.get({ id: routeId });
    if (error) return { status: 'bad', message: err.message, error };
    if (!!route === false) return { status: 'bad', message: 'Ошибка получения маршрута' };

    [error, rows] = await Model.routes.upd(req.body);
    if (error) return { status: 'bad', message: err.message, error };

    [error, route] = await Model.routes.get({ id: routeId });

    [error, req.app.locals.routesList] = await initRoutes();

    return { status: 'ok' };
}