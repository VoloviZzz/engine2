const path = require('path');
const request = require('request');
const api = require('../../memory-book-api');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		let data = {
			deads: [],
			biographies: [],
			necrologues: [],
		};

		try {
			[data.deads, data.biographies, data.necrologues] = await Promise.all([
				api.get('deads2', { state: '3' }),
				api.get('biographies', { state: '3' }),
				api.get('necrologues', { state: '3' })
			])
		} catch (e) {
			console.log('Ошибка api "memory_book":');
			console.log(e);
		}

		data.countDeads = data.deads.countDeads || 0;
		data.deads = data.deads.deads || [];
		dataViews.data = data;
		dataViews.user = session.user;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}