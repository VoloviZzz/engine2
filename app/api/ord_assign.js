const retailApi = require('../retail-api');

exports['ord_assign'] = (req, res, next) => {
	return new Promise((resolve, reject) => {
		retailApi.getFlowers().then(result => {
			return req.app.ejs.renderFile(path.join(__dirname, '../components/dead-view/flowers-list.ejs'), { flowersUrl: retailApi.rootUrl, flowers: result }, function (error, content) {
				if (error) {
					return resolve({ data: error.message, error });
				}

				return resolve({ status: 'ok', data: content });
			});
		})
	}).then((result) => {
		return result;
	}).catch(error => {
		return { message: error.message, error };
	})
}