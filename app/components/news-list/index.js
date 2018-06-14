const path = require('path');
const Model = require('../../models');
const Pagination = require('../../libs/pagination');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			const { locals } = data;

			const dataViews = {
				user: {},
				locals: {},
			};

			const [, news] = await Model.news.get({ public: '1', orderBy: 'created DESC' });
			const [, newsNotPublic] = await Model.news.get({ public: '0', orderBy: 'created DESC' });

			var [, [{ countNews }]] = await app.db.execQuery(`SELECT COUNT(id) as countNews FROM news WHERE public = '1'`);
			const pagination = new Pagination({ countOnPage: 10, currentPage: locals.reqQuery.page, allCountPosts: countNews });

			let resArray = news.slice(pagination.options.offset, pagination.options.offset + pagination.options.countOnPage);

			dataViews.news = resArray;
			dataViews.pagination = pagination;
			dataViews.newsNotPublic = newsNotPublic;

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