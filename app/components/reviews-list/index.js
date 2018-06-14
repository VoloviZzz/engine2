const path = require('path');
const Pagination = require('../../libs/pagination');

module.exports = (app) => {
	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const { fragment, dynamicRouteNumber: agentId } = locals;

		// пагинация
		const reviewsCountParams = {
			targetType: fragment.settings.targetType,
			targetId: agentId,
			or: { client_id: session.user.id }
		};

		var [error, [{ reviews_count: countReviews }]] = await Model.reviews.getCount(reviewsCountParams);
		const pagination = new Pagination({ countOnPage: 10, allCountPosts: countReviews, paramName: 'reviewsPage', currentPage: locals.reqQuery.reviewsPage, pageUrlQuery: locals.reqQuery });
		// ----------

		const reviewsGet = {
			public: '1',
			targetType: fragment.settings.targetType,
			targetId: agentId,
			or: {
				client_id: session.user.id
			},
			limit: `${pagination.options.offset}, ${pagination.options.countOnPage}`,
		};

		var [error, reviews] = await Model.reviews.get(reviewsGet);
		var [, reviewsNotPublished] = await Model.reviews.get({ public: '0', targetType: fragment.settings.targetType });

		var [error, reviewsCats] = await Model.reviews.getTargets();

		dataViews.reviews = reviews;
		dataViews.reviewsNotPublished = reviewsNotPublished;
		dataViews.user = session.user;
		dataViews.reviewsCats = reviewsCats;
		dataViews.fragment = fragment;
		dataViews.agentId = agentId;
		dataViews.pagination = pagination;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}