const retailApi = require('../retail-api');

exports['flower_mods'] = (req, res, next) => {
	return new Promise((resolve, reject) => {
		retailApi.query('get_mods', { good: req.body.good }).then(result => {
			const flowers = result[req.body.good];
			return req.app.ejs.renderFile(path.join(__dirname, '../components/dead-view/flowers-mods.ejs'), { flowersUrl: retailApi.rootUrl, flowers: flowers }, function (error, content) {
				if (error) {
					console.log(error);
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