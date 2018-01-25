const Model = require('../models');
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

    [error, route] = await Model.routes.get({ id: routeId });
    if (error) return { status: 'bad', message: err.message, error };
    if (!!route === false) return { status: 'bad', message: 'Ошибка получения маршрута' };
    
    if(route.delete_access == "0" && req.session.user.root != "1") {
        return {message: 'Недостаточно прав для удаления данного маршрута'}
    }

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

    if(route.edit_access == "0" && req.session.user.root != "1") {
        return {message: 'Недостаточно прав для редактирования данного маршрута'}
    }

    [error, rows] = await Model.routes.upd(req.body);
    if (error) {
        console.log(error)
        return { status: 'bad', message: error.message, error };
    } 

    [error, route] = await Model.routes.get({ id: routeId });

    [error, req.app.locals.routesList] = await initRoutes();

    return { status: 'ok' };
}