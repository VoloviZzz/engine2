const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, content, dataViews = {} }) => {
		// logic...
		
		dataViews.locals = locals;
		dataViews.title = content.content

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}