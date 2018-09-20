const path = require('path');
const db = require('../../libs/db');

module.exports = (app) => {

	return async (data = {}) => {

		const [queryError, templatesList] = await db.execQuery("SELECT * FROM templates");
		if (queryError) throw new Error(queryError);

		var [error, routes] = await app.Model.routes.get();
		if (error) {
			console.error(error);
			return Promise.resolve(['', error.message]);
		}

		var [error, targets] = await app.Model.routesTargets.get();
		if (error) {
			console.error(error);
			return Promise.resolve(['', error.message]);
		}

		const routesList = routes.map(route => {
			if (route.access == "3" && !!data.locals.user.root === true) {
				return route;
			}
			else if (route.access != "3") {
				return route;
			}
		}).filter(r => !!r === true);

		const templatePath = path.join(__dirname, 'template.ejs');
		return new Promise((resolve, reject) => {
			const template = app.ejs.renderFile(templatePath, { user: data.locals.user, routesList, templatesList, targets }, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}