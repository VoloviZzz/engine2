const path = require('path');
const request = require('request');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		return new Promise((resolve, reject) => {

			const requestData = {
				method: 'POST', url: apiUrl, form: {
					__function__: 'getPlace',
					key: apiKey,
					id: locals.dynamicRouteNumber,
				}
			};

			request(requestData, (error, response, body) => {

				if (error) {
					console.log(error);
					return reject(error)
				}

				try {
					body = JSON.parse(body);

					if (body.status == false) {

						let err = new Error("Страница участка не найдена");
						err.status = 404;

						return reject(err);
					}

					if (body.status == 'bad') {
						let err = new Error("Ошибка сервера");
						err.status = 500;

						return reject(err);
					}

					dataViews.data = body.data;

					return resolve();
				}
				catch (e) {
					console.log('ОШИБКА: ');
					console.error(e);
				}
			})
		}).then(() => {
			return new Promise((resolve, reject) => {
				const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
					if (err) return resolve([err, err.toString()]);

					return resolve([err, str]);
				});
			})
		}).catch(error => {
			return Promise.resolve([err, err.toString()]);
		})
	}
}