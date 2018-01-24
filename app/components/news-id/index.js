const path = require('path');
const Model = require('../../models');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

            const news_id = data.locals.dynamicRouteParam;

            if(!!news_id === false) throw new Error("Отсутствует аргумент для динамического фрагмента страницы")

			const dataViews = {
				user: {},
				locals: {},
            };

            const [, news] = await Model.news.get({id: news_id});

            if(news.length < 1) return resolve([, 'Новость не найдена'])

            dataViews.news = news[0];
            
			Object.assign(dataViews.user, data.locals.user);
            Object.assign(dataViews.locals, data.locals);

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if(err) return resolve([err, err.toString()]);

	
				return resolve([err, str]);
			});
		})
	}
}