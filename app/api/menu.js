const { Model } = require('../models');

exports.addMenuItem = async function(req, res, next) {
	const [addError, resQuery] = await Model.menu.addMenuItem(req.body);
	if(addError) return {status: 'bad', message: addError.message}

	return {status: 'ok', data: req.body}
}

exports.deleteMenuItem = async function(req, res, next) {
	return Model.menu.deleteMenuItem({id: req.body.menu_id}).then(([error, result]) => {
		if(error) return Promise.resolve({status: 'bad', message: addError.message})
		return Promise.resolve({status: 'ok', data: req.body})
	});
}

exports.addMenuGroup = async function(req, res, next) {

	return Model.menu.addMenuGroup(req.body).then(([error, menuGroupId]) => {
		return Model.routes.upd({id: req.body.route_id, menu: menuGroupId});
	}).then(([error, result]) => {
		return Model.routes.get({id: req.body.route_id});
	}).then(([error, route]) => {
		req.app.locals.routesList[route.url] = route;
		return Promise.resolve({status: 'ok', data: req.body})
	});
}