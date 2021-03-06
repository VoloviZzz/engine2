const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const postsGetParams = {};

		if (locals.user.adminMode == false) {
			postsGetParams.public = '1';
		}

		var [error, agents] = await Model.agents.get(postsGetParams);

		dataViews.agents = agents;
		dataViews.fragment = locals.fragment;

		return new Promise((resolve, reject) => {
			app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}