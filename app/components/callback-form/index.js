const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		dataViews.user = session.user;
		dataViews.targetId = locals.dynamicRouteNumber;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, '<pre>' + err.toString() + '</pre>']);

				return resolve([err, str]);
			});
		})
	}
}