const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		var [error, achievements] = await Model.achievements.get();
		if (error) throw new Error(error);

		const countOnPage = 10;
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

		dataViews.user = session.user;
		dataViews.achievements = resArray;
		dataViews.pagination = pagination;
		dataViews.fragment = locals.fragment;
		// console.log(pagination);
		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}
