const path = require('path');
const request = require('request');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const userId = session.user.id;
		var visitedIds = [];
		var visitedGraves = [];
		var visitedGravesCards = [];

		if (!!userId === false) return Promise.resolve([, 'Ошибка доступа компонента']);

		locals.placesArray = [];

		var [error, visitedGraves] = await Model.visitedGraves.get({ client_id: userId });
		locals.visitedGraves = visitedGraves;

		let functionsArray = [];

		visitedGraves.forEach(g => {
			functionsArray.push(
				getDeadInfo(g.grave_id)
			);
		});

		try {
			visitedGravesCards = await Promise.all(functionsArray)
		}
		catch (e) {
			console.log(e);
		}

		locals.visitedGravesCards = visitedGravesCards;

		dataViews.user = session.user;

		Object.assign(dataViews, locals);

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}

function getDeadInfo(id) {
	return new Promise((resolve, reject) => {

		const postData = {
			__function__: 'getDead',
			key: apiKey,
			id: id
		};

		request.post(apiUrl, { form: postData }, (error, response, body) => {
			if (error) {
				return reject(error);
			}

			body = JSON.parse(body);

			if (body.status == false || body.status == 'bad') {
				return reject({ status: 'bad' });
			}

			return resolve(body.data.grave);
		})
	})
}