const { Model } = require('../models');

exports.addMenuItem = async function(req, res, next) {
	console.log(req.body)
	const [addError, resQuery] = await Model.menu.addMenuItem(req.body);
	if(addError) return {status: 'bad', message: addError.message}

	return {status: 'ok', data: req.body}
}