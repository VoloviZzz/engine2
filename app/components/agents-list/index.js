const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		var currentTarget = 'Вызов агентов';

		const postsGetParams = {
			target: currentTarget,
		};

		if (session.user.adminMode == false) {
			postsGetParams.public = '1';
		}

		var [error, agents] = await Model.posts.get(postsGetParams);

		dataViews.agents = agents;
		dataViews.user = session.user;
		dataViews.fragment = locals.fragment;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}