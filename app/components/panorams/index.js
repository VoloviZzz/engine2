const path = require('path');

module.exports = (app) => {

	const Model = app.Model;
	return async ({ locals, session, dataViews = {} }) => {

		var [error, panorams] = await Model.panorams.get();

		dataViews.panorams = panorams;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);
				return resolve([err, str]);
			});
		})
	}
}
