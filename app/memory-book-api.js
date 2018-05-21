const request = require('request');

const api = {
	memoryBookUrl: 'http://89.108.70.31:3003/api/',

	get(url, options = {}) {
		return new Promise((resolve, reject) => {
			request({
				method: 'GET',
				url: url + options.ctrl,
			}, (error, response, body) => {
				if (error) {
					return reject(error);
				}

				return resolve(JSON.parse(body));
			});
		})
	},

	post(url, options = {}) {
		return new Promise((resolve, reject) => {
			request({
				method: 'POST',
				url: url,
				form: options.data,
			}, (error, response, body) => {
				if (error) {
					return reject(error);
				}

				return resolve(JSON.parse(body));
			});
		})
	},
};

module.exports = api;