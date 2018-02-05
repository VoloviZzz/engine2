const path = require('path');
const Menu = require('../../libs/menu');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			let menuTree = false;

			if(!!data.locals.route.menu_id) {
				menuTree = await Menu.constructMenu({menu_id: data.locals.route.menu_id});
			}
			
			const dataViews = {
				user: {},
				locals: {},
			};
			
			
			const [, menuGroups] = await app.Model.menu.getMenuGroups();

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);
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