const path = require('path');
const fs = require('fs');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		var [error1, components] = await Model.components.get();
		var [error, componentBlocks] = await Model.components.getComponentBlocks();

		const controllersList = fs.readdirSync(`${AppRoot}/components`);

		dataViews.componentsList = components;
		console.log(error1);
		dataViews.componentBlocks = componentBlocks;
		dataViews.controllersList = controllersList;

		return new Promise((resolve, reject) => {
			app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}
