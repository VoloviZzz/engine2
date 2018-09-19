const path = require('path');
const fs = require('fs');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		var [error, components] = await Model.components.get();
		var [error, componentBlocks] = await Model.components.getComponentBlocks();

		const controllersList = fs.readdirSync(`${AppRoot}/components`);

		dataViews.componentsList = components;
		dataViews.componentBlocks = componentBlocks;
		dataViews.user = session.user;
		dataViews.controllersList = controllersList;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}