const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			const dataViews = {
				user: {},
				locals: {},
				clients: []
			};

			const [, clients] = await app.Model.clients.get({ limit: 25, orderBy: 'id desc' });

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);
			dataViews.clients = clients;

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if (err) console.log(err);
				if (err) return resolve([err, err.toString()]);


				return resolve([err, str]);
			});
		})
	}
}