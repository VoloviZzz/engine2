const request = require('request')

module.exports = {
	url: `https://system.mpkpru.ru/m1api/`,
	apiKey: '01234567890123456789012345678901',
	apiLocCode: '74-МГ',

	search(queryParams = {}, ctrl) {

		queryParams.__function__ = ctrl;
		queryParams.key = this.apiKey;

		return new Promise((resolve, reject) => {
			request.post(this.url, { form: queryParams }, (error, response, body) => {
				if (error) {
					return reject(error);
				}

				try {
					body = JSON.parse(body);

					if (body.status != 'ok') {
						return reject({ message: 'Произошла ошибка. ' + body.error });
					}
				}
				catch (e) {
					console.log('ERROR');
					return reject({ message: 'Произошла ошибка. ' + e.message, e });
				}

				return resolve(body.data);
			})
		})
	},

	getDeadInfo(id) {
		return new Promise((resolve, reject) => {
			const requestParams = {
				__function__: 'getDead',
				key: this.apiKey,
				id: id,
			};

			request.post(this.url, { form: requestParams }, (error, response, body) => {
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
};