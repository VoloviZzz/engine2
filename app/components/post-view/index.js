const path = require('path');

module.exports = (app) => {

	const Model = app.Model;
	const { db } = app;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		try {
			const routeParam = locals.dynamicRouteNumber;

			var [error, post] = await Model.posts.get({ id: routeParam });
			if (error) {
				console.log(error);
				throw new Error(error);
			}

			post = post[0] ? post[0] : false;

			if (!!post === false) {
				return Promise.resolve([, 'Публикая не найдена']);
			}

			var similarPosts = null;

			var [error, postCategories] = await app.db.execQuery(`SELECT * FROM post_categories WHERE target_id = '${post.target}'`);

			if (post.similar_posts_id) {
				var [error, similarPosts] = await app.db.execQuery(`SELECT * FROM posts WHERE id IN (${post.similar_posts_id})`);
			}
			else {
				const countSimilarPosts = 5;
				var [error, similarPosts] = await app.db.execQuery(`SELECT * FROM posts WHERE cat = '${post.cat}' AND target = '${post.target}' AND id <> '${post.id}' ORDER BY RAND() LIMIT ${countSimilarPosts}`);

				var similarIds = similarPosts.reduce((prev, current) => {
					prev.push(current.id);
					return prev;
				}, []).join(',');

				await db.execQuery(`UPDATE posts SET similar_posts_id = '${similarIds}' WHERE id = '${post.id}'`);

				post.similar_posts_id = similarIds;
			}


			if (error) {
				console.log(error);
				return Promise.resolve(["Что-то пошло не так"]);
			}

			var [error, aliases] = await Model.aliases.get({ route_id: locals.route.id });
			if (error) {
				console.log(error);
				return Promise.resolve(["Что-то пошло не так"]);
			}

			locals.route.show_title = false;

			dataViews.similarPosts = similarPosts;
			dataViews.aliases = aliases;
			dataViews.post = post;
			dataViews.postCategories = postCategories;
			locals.route.title = post.title;
			dataViews.user = session.user;
			dataViews.fragment = locals.fragment;
		} catch (e) {
			console.log(e);
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