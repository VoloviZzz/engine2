const path = require('path');
const db = require('../../libs/db');

module.exports = (app) => {

	return async (data = {}) => {

		const [queryError, templatesList] = await db.execQuery("SELECT * FROM templates");
		if (queryError) throw new Error(queryError);
		
		const routesList = Object.keys(app.locals.routesList).map(key => {
			const route = app.locals.routesList[key];
			
			if (route.access == "3" && !!data.locals.user.root === true) {
				return route;
			}
			else if (route.access != "3") {
				return route;
			}
		}).filter(r => !!r === true);
		
		const templatePath = path.join(__dirname, 'template.ejs');
		return new Promise((resolve, reject) => {
			const template = app.ejs.renderFile(templatePath, {user: data.locals.user, routesList, templatesList }, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}