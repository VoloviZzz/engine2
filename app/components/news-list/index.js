const path = require('path');
const Model = require('../../models');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			const { locals } = data;

			const dataViews = {
				user: {},
				locals: {},
			};

			const [, news] = await Model.news.get({ orderBy: 'created DESC' });

			const countOnPage = 10;
			const curPage = locals.reqQuery.page || 1;
			const pagOffset = (curPage - 1) * countOnPage;

			if (pagOffset < 0) {
				pagOffset = 0;
			}

			let countPages = news.length / countOnPage;

			if (Number.isInteger(countPages) === false) {
				countPages = parseInt(countPages + 1)
			}

			let resArray = news.slice(pagOffset, pagOffset + countOnPage);

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

			dataViews.news = resArray;
			dataViews.pagination = pagination;

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);


				return resolve([err, str]);
			});
		})
	}
}