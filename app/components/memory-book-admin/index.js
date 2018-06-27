const path = require('path');
const memoryBook = require('../../memory-book-api');
const Pagination = require('../../libs/pagination');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const currentPage = locals.reqQuery.page || 1;
		const part = (currentPage - 1) > 0 ? currentPage - 1 : 0;

		const getMemoryParams = {
			count: 10,
			stateIn: [0, 2],
			part,
		};

		const { deads, countDeads } = await memoryBook.get('deads2', getMemoryParams);
		const pagination = new Pagination({ allCountPosts: countDeads, countOnPage: getMemoryParams.count, currentPage: currentPage });

		dataViews.user = session.user;
		dataViews.pagination = pagination;
		dataViews.deads = deads;
		dataViews.countDeads = countDeads;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}