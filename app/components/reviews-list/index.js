const path = require('path');

module.exports = (app) => {
	const Model = app.Model;
	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const [, reviews] = await Model.reviews.get({public: '1'});
		const [, reviewsNotPublished] = await Model.reviews.get({public: '0'});

		dataViews.reviews = reviews;
		dataViews.reviewsNotPublished = reviewsNotPublished;
		dataViews.session = session;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}