const path = require('path');

module.exports = (app) => {

	const Model = app.Model;
	const { db } = app;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		try {
			const routeParam = locals.dynamicRouteNumber;

			[, [post]] = await Model.posts.get({ id: routeParam });
			dataViews.post = post;
			locals.route.title = post.title;
			dataViews.user = session.user;
		} catch (e) {
			return Promise.resolve([, 'Что-то пошло не так']);
		}

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}