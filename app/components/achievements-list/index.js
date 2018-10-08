const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const { fragment } = locals;

		fragment.settings.countOnPage = fragment.settings.countOnPage || 10;

		var [error, achievements] = await Model.achievements.get();
		if (error) throw new Error(error);

		const countOnPage = fragment.settings.countOnPage;
		const curPage = locals.reqQuery.page || 1;
		const pagOffset = (curPage - 1) * countOnPage;

		if (pagOffset < 0) {
			pagOffset = 0;
		}

		let countPages = achievements.length / countOnPage;

		if (Number.isInteger(countPages) === false) {
			countPages = parseInt(countPages + 1)
		}

		let resArray = achievements.slice(pagOffset, pagOffset + countOnPage);

		let pagLeft = curPage - 3;
		let pagRight = +curPage + 3;

		if (pagLeft < 1) {
			pagRight += +Math.abs(pagLeft);
			pagLeft = 1;
		}

		if (pagRight > countPages) {
			pagRight = countPages + 1;
		}

		const pagination = {
			left: pagLeft,
			right: pagRight,
			curPage,
			countPages
		}

		dataViews.achievements = resArray;
		dataViews.pagination = pagination;
		dataViews.fragment = locals.fragment;
		
		return new Promise((resolve, reject) => {
			app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}
