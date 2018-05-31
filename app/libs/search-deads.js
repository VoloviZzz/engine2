const request = require('request')

module.exports = {
	url: `http://oper.letaindex.ru:3001/api`,
	apiKey: '01234567890123456789012345678901',

	search(queryParams = {}, ctrl) {

		queryParams.__function__ = ctrl;
		queryParams.key = this.apiKey;

		return new Promise((resolve, reject) => {
			request.post(this.url, {form: queryParams}, (error, response, body) => {
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
};