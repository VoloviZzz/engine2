const request = require('request')

module.exports = {
	url: 'http://185.20.179.12:80/api/',

	search(queryParams = {}) {

        const form = {
            '__function__': 'search',
            data: JSON.stringify(queryParams)
        };

        return new Promise((resolve, reject) => {
            request.post({url: this.url, form}, (err, response, body) => {
                if(err) {
                    return reject(err);
                }


                try {
                    body = JSON.parse(body);

                    if(body.status == 'false') {
                        return reject({message: 'Произошла ошибка. ' + body.data});
                    }
                }
                catch(e) {}

                return resolve(body);
            })
        })
	},
};