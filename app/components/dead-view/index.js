const path = require('path');
const request = require('request');
const api = require('../../memory-book-api');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		let defaultData = {
			id: locals.dynamicRouteNumber,
		};

		let data = {};

		let memory = [];
		let visitedGraves = [];

		let body = false;

		data = Object.assign(defaultData, data);

		try {
			body = await getDeadInfo(data.id);
		}
		catch (e) {
			console.log(e);
			return Promise.resolve([null, 'Не удалось получить информацию об умершем'])
		}

		try {
			[, visitedGraves] = await Model.visitedGraves.get({ client_id: session.user.id, grave_id: defaultData.id });
		}
		catch (e) {
			console.log('Ошибка получение посещаемых захоронений');
			console.log(e);
		}

		dataViews.visitGrave = false;

		if (visitedGraves.length > 0) {
			dataViews.visitGrave = true;
		}

		let necs = [];
		let bio = [];

		try {
			// memory = await getMemory(['necrologues', 'biographies'], { dead_id: data.id });
			// necs = memory[0];
			// bio = memory[1];
		} catch (error) {
			console.log('Ошибка выполнения API MEMORY_BOOK: ');
			console.log(error.toString());
		}

		let photos = [];

		try {
			// photos = await api.photos.getPhotos({ form: { dead_id: defaultData.id } });
		} catch (error) {
			console.log(error);
		}

		body = JSON.parse(body);
		body.data.bio = bio;
		body.data.necs = necs;
		body.data.photos = photos.data;

		if (body.status == false) {

			let err = new Error("Страница захоронения не найдена");
			err.status = 404;

			return next(err);
		}

		if (body.status == 'bad') {

			let err = new Error("Ошибка сервера");
			err.status = 500;

			return next(err);
		}

		dataViews.flowers = [];
		dataViews.data = body.data;
		dataViews.user = session.user;
		dataViews.memoryBookPhotoPath = api.memoryBookPhotoPath;

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
		request({
			method: 'POST',
			url: apiUrl,
			form: {
				__function__: 'getDead',
				key: apiKey,
				id: id,
			}
		}, (error, response, body) => {
			if (error) {
				return reject(error);
			}

			if (body.status == false || body.status == 'bad') {
				return reject({ status: 'bad' });
			}

			return resolve(body);
		})
	})
}

function getMemory(data = [], options = {}) {
	return new Promise((resolve, reject) => {
		request({
			method: 'POST', url: api.memoryBookUrl + 'memory.get', form: {
				values: JSON.stringify(data),
				options: JSON.stringify(options)
			}
		}, (error, response, body) => {
			if (error) {
				return reject(error);
			}

			body = JSON.parse(body);
			return resolve(body);
		})
	})
}