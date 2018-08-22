const Model = require('../../models');
const path = require('path');
const Menu = require('../../libs/menu');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			let menuTree = false;

			var [error, route] = await Model.routes.get({ id: data.locals.route.id });

			if (!!route.menu_id === true) {
				menuTree = await Menu.constructMenu({ menu_id: route.menu_id });
			}

			const dataViews = {
				user: {},
				locals: {},
			};

			const [, menuGroups] = await app.Model.menu.getMenuGroups();

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);
			
			dataViews.locals.route = route;
			dataViews.menuTree = menuTree;
			dataViews.locals.menuGroups = menuGroups;

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}