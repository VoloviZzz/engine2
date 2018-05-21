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
				api.get(api.memoryBookUrl, { ctrl: 'deads' }),
				api.get(api.memoryBookUrl, { ctrl: 'biographies' }),
				api.get(api.memoryBookUrl, { ctrl: 'necrologues' })
			])
		} catch (e) {
			console.log('Ошибка api "memory_book":');
			console.log(e);
		}

		data.countDeads = data.deads[1] || 0;
		data.deads = data.deads[0] || [];
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