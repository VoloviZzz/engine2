const request = require('request');

const errors = {
	falseData: 'Отсутствует параметр data',
	falseFormData: 'Отсутствует параметр formData',
	falseForm: 'Отсутствует параметр form',
}

const api = {
	memoryBookPhotoPath: 'http://localhost:3003',
	memoryBookUrl: 'http://localhost:3003/api/',

	photos: {
		addPhoto(data = false) {
			return api.postFormData('photos.add', data);
		},

		getPhotos(data = {}) {
			return api.post('photos.get', data);
		},
	},

	deads: {
		search(data = false) {
			return api.post('deads.search', data);
		}
	},

	memory: {
		del(data = false) {
			if (!!data === false) return Promise.reject(`mb.api.memory.del: ${errors.falseData}`);
			if (!!data.form === false) return Promise.reject(`mb.api.memory.del: ${errors.falseForm}`);

			return api.post('memory.del', data);
		},

		add(data = false) {
			if (!!data === false) return Promise.reject(`mb.api.memory.add: ${errors.falseData}`);
			if (!!data.form === false) return Promise.reject(`mb.api.memory.add: ${errors.falseForm}`);

			return api.post('memory.add', data);
		},

		upd(data = false) {
			if (!!data === false) return Promise.reject(`mb.api.upd.add: ${errors.falseData}`);
			if (!!data.form === false) return Promise.reject(`mb.api.memory.upd: ${errors.falseForm}`);
			if (!!data.target === false) return Promise.reject(`mb.api.memory.upd: data.target is false`);

			return api.post(`${data.target}.upd`, data);
		}
	},

	get(ctrl, data = {}) {
		return new Promise((resolve, reject) => {
			request.get(api.memoryBookUrl + ctrl, { form: data.formData }, function optionalCallback(error, httpResponse, body) {
				if (error) {
					reject(error);
				}

				try {
					body = JSON.parse(body);

					resolve(body);
				} catch (error) {
					reject({ message: 'mb.api.get: не удалось преобразовать тело ответа в JSON.', body });
				}
			});
		})
	},

	post(ctrl, data = { form: false }) {
		return new Promise((resolve, reject) => {
			request.post(this.memoryBookUrl + ctrl, { form: data.form || {} }, function optionalCallback(error, httpResponse, body) {
				if (error) {
					reject(error);
				}

				try {
					body = JSON.parse(body);

					resolve(body);
				} catch (error) {
					reject({ message: 'mb.api.post: не удалось преобразовать тело ответа в JSON.', body });
				}
			});
		})
	},

	postFormData(ctrl, data = false) {
		if (!!data === false) return Promise.reject(`mb.api.postFormData: ${errors.falseData}`);
		if (!!data.formData === false) return Promise.reject(`mb.api.postFormData: ${errors.falseFormData}`);
		return new Promise((resolve, reject) => {
			request.post(this.memoryBookUrl + ctrl, { formData: data.formData }, function optionalCallback(error, httpResponse, body) {
				if (error) {
					reject(error);
				}

				try {
					body = JSON.parse(body);

					resolve(body);
				} catch (error) {
					reject({ message: 'mb.api.postFormData: не удалось преобразовать тело ответа в JSON.', body });
				}
			});
		})
	},
};

module.exports = api;