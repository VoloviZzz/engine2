const path = require('path');
const Model = require('../../models');

module.exports = (app) => {
	return (data) => {
		return new Promise(async (resolve, reject) => {

			let news_id, news_alias;

			if (data.locals.dynamicRouteAlias) {
				news_alias = data.locals.dynamicRouteAlias;
			}
			else {
				news_id = data.locals.dynamicRouteNumber;
			}

			if (!!news_id === false && !!news_alias === false) return resolve([, "Отсутствует аргумент для динамического фрагмента страницы"])

			const dataViews = {
				user: {},
				locals: {},
			};

			let news = [];

			if (news_alias) {
				[, aliases] = await Model.aliases.get({ title: news_alias, target: 'news' });
				if (aliases.length < 1) return resolve([, 'Новость не найдена'])

				news_id = aliases[0].target_id;
			}

			[, news] = await Model.news.get({ id: news_id });

			if (news.length < 1) return resolve([, 'Новость не найдена'])

			dataViews.news = news[0];

			data.locals.route.title = news[0].title;

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);


				return resolve([err, str]);
			});
		})
	}
}