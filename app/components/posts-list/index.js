const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const { fragment } = locals;

		fragment.settings = !!fragment.settings ? JSON.parse(fragment.settings) : {};
		
		const currentTarget = fragment.settings.target;

		let templatePath;
		let posts = [];
		let [, postTargets] = await app.db.execQuery(`SELECT * FROM post_targets`);

		if (!!currentTarget === false) {
			templatePath = path.join(__dirname, 'settings.ejs')
		} else {
			templatePath = path.join(__dirname, 'template.ejs');

			[, posts] = await app.db.execQuery(`SELECT * FROM posts WHERE target = '${currentTarget}'`);

			dataViews.posts = posts;
		}

		dataViews.user = session.user;
		dataViews.postTargets = postTargets;
		dataViews.currentTarget = currentTarget;
		dataViews.fragment = locals.fragment;

		return new Promise((resolve, reject) => {
			app.render(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}