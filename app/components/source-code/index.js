const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...
		const fragmentId = locals.fragment.id;
		var [error, value] = await Model.fragments.getFragmentsData({ fragment_id: fragmentId });
		if(error) throw new Error(error);
		
		if(value.length > 0) {
			value = JSON.parse(value[0].data).content.value;
		} else {
			value = '';
		}

		dataViews.user = session.user;
		dataViews.locals = locals;
		dataViews.value = value;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}