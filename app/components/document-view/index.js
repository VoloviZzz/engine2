const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const documentId = locals.dynamicRouteNumber;

		const [, [document]] = await Model.documents.get({ id: documentId });

		if (!!document === false) return Promise.resolve([, "Не найдено"]);

		dataViews.document = document;
		dataViews.user = session.user;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}