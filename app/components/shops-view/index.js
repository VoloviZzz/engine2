const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const shopId = locals.dynamicRouteNumber;

		const [, [shop]] = await Model.shopsList.get({id: shopId});

		if(!!shop === false) return Promise.resolve([, 'Страница не найдена'])

		locals.route.title = shop.title;

		shop.phones = shop.phones.split(',');
		shop.schedule = JSON.parse(shop.schedule);

		dataViews.shop = shop;
		dataViews.user = session.user;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}