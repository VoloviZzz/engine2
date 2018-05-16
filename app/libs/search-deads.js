const request = require('request')

module.exports = {
	//url: `http://oper.letaindex.ru:3001/api`,
	url: `http://system/m1api/`,
	apiKey: '01234567890123456789012345678901',

	search(queryParams = {}, ctrl) {

		queryParams.__function__ = ctrl;
		queryParams.key = this.apiKey;
		
		console.log({ method: 'POST', url: this.url, form: queryParams });

		return new Promise((resolve, reject) => {
			request({ method: 'POST', url: this.url, form: queryParams }, (err, response, body) => {
				
				console.log(err);
				// console.log(response);
				console.log(body);
				
				if (err) {
					return reject(err);
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