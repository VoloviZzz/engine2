const path = require('path');

module.exports = (app) => {
	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}