const path = require('path');

module.exports = (app) => {

	return (data = {}) => {

		const templatePath = path.join(__dirname, 'template.ejs');

		const componentsList = app.locals.componentsList;

		return new Promise((resolve, reject) => {
			const template = app.ejs.renderFile(templatePath, { url: data.req.url, routesObj: app.locals.routesList, componentsList }, (err, str) => {
				if (err) return resolve([err, null]);

				return resolve([err, str]);
			});
		})
	}
}