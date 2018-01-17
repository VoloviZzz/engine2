const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise((resolve, reject) => {

			const dataViews = {
				user: {},
			};

			Object.assign(dataViews.user, data.locals);

			app.locals.postRoutes['/login'] = (req, res, next) => {
				return new Promise((resolve, reject) => {
					let data = req.body;
					
					return app.db.execQuery("SELECT * FROM clients");
				})
			};

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.ejs.renderFile(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, null]);

				return resolve([err, str]);
			});
		})
	}
}