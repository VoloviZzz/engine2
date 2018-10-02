const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const { fragment } = locals;

		fragment.settings.objectUrl = fragment.settings.objectUrl || '';

		var [error, vacancies] = await Model.vacancies.get();

		dataViews.vacancies = vacancies;
		
		dataViews.fragment = fragment;

		return new Promise((resolve, reject) => {
			app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}