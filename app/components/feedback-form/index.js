const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const user_id = session.user.id;
		var client = {};


		if (user_id !== false) {
			var [error, client] = await Model.clients.get({ id: user_id });

			if (client.length > 0) {
				client = client[0];
				client.fio = `${client.surname} ${client.firstname} ${client.patronymic}`
			}
		}

		dataViews.client = client;
		dataViews.fragment = locals.fragment;
		dataViews.user = session.user;
		dataViews.formTitle = locals.fragment.settings.title || 'Обратная связь';

		return new Promise((resolve, reject) => {
			app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}