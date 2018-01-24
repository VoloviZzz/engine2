const path = require('path');
const db = require('../../libs/db');

module.exports = (app) => {

	return async (data = {}) => {

		const templatePath = path.join(__dirname, 'template.ejs');

		const componentsList = app.locals.componentsList;

		const [queryError, templatesList] = await db.execQuery("SELECT * FROM templates");
		if(queryError) throw new Error(queryError);

		return new Promise((resolve, reject) => {
			const template = app.ejs.renderFile(templatePath, { url: data.req.url, routesObj: app.locals.routesList, componentsList, templatesList }, (err, str) => {
				if (err) return resolve([err, null]);

				return resolve([err, str]);
			});
		})
	}
}