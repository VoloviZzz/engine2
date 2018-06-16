const path = require('path');
const Pagination = require('../../libs/pagination');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const { fragment } = locals;
		const currentTarget = fragment.settings.target;

		// пагинация
		var [, [{ all_count: countReviews }]] = await app.db.execQuery(`SELECT COUNT(id) as all_count FROM posts WHERE target = '${currentTarget}'`);
		const pagination = new Pagination({ countOnPage: 12, allCountPosts: countReviews, currentPage: locals.reqQuery.page, pageUrlQuery: locals.reqQuery });
		// ----------

		var templatePath;
		var posts = [];
		var [, postTargets] = await app.db.execQuery(`SELECT * FROM post_targets`);

		if (!!currentTarget === false) {
			templatePath = path.join(__dirname, 'settings.ejs')
		} else {
			templatePath = path.join(__dirname, 'template.ejs');

			const postsGetParams = {
				target: currentTarget,
				orderBy: 'id DESC',
				limit: `${pagination.options.offset}, ${pagination.options.countOnPage}`
			};

			if (session.user.adminMode == false) {
				postsGetParams.public = '1';
			}

			var [error, posts] = await Model.posts.get(postsGetParams);

			dataViews.posts = posts;
		}

		dataViews.user = session.user;
		dataViews.postTargets = postTargets;
		dataViews.currentTarget = currentTarget;
		dataViews.fragment = locals.fragment;
		dataViews.pagination = pagination;

		return new Promise((resolve, reject) => {
			app.render(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}