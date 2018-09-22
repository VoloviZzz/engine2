const Model = require('../models');

exports.add = async (req, res, next) => {
	try {
		var [error] = await Model.aliases.add(req.body);
		if (error) {
			throw new Error(error);
		}

		return { status: 'ok' };
	} catch (error) {
		console.log(error);
		return { status: 'bad', message: error.message };
	}
}