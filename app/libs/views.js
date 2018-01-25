const Model = require('../models');

exports.createView = async function createView(req, res, next) {

	let path = req.url;
	let publicPaths = /\/js\/|\/css\//;

	if (publicPaths.test(path) === false) {
		try {
			await Model.views.add({ visitId: req.session.user.visitId, visitorId: req.session.user.visitorId, path });
		} catch (e) {
			console.log('Создание нового просмотра не удалось');
			console.log(e);
		}
	};

	return next();
}