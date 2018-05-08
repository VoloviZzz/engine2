const SearchDeadsApi = require('../libs/search-deads.js');

exports.search = (req, res, next) => {
	return new Promise(async (resolve, reject) => {
		const Model = req.app.Model;
		let data = req.body;

		let defaultData = {
			part: 0,
			fullname: '',
			surname: '',
			firstname: '',
			patronymic: '',
			placeId: '',
			id: '',
			search_mode: 'default',
		};

		data = Object.assign(defaultData, data);

		let querySearch, graves = {};

		try {
			querySearch = await SearchDeadsApi.search(data);
		}
		catch (e) {
			return resolve({ data: 'Сервер поиска захоронений временно не доступен', e });
		}

		if (!!querySearch.data === true) {
			graves = querySearch.data;
		}
		return req.app.ejs.renderFile(path.join(__dirname, '../components/search-deads/search-grave.ejs'), { graves }, function (error, content) {
			if (error) {
				return resolve({ data: error.message, error })
			}

			return resolve({ status: 'ok', data: content });
		});
	})
}