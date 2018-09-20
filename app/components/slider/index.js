const path = require('path');
const db = require('../../libs/db');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const { fragment } = locals;
		const { id } = fragment;

		const { user } = session;

		if (user.adminMode) {
			var [error, slides] = await db.execQuery(`SELECT * FROM slides WHERE fragment_id = '${id}' ORDER BY priority desc`);
		} else {
			var [error, slides] = await db.execQuery(`SELECT * FROM slides WHERE fragment_id = '${id}' AND published = 1 ORDER BY priority desc`);
		}


		dataViews.user = session.user;
		dataViews.fragment = fragment;
		dataViews.slides = slides;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}