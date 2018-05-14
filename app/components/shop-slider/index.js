const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {
			const [, goodsCategories] = await app.Model.goodsCategories.get({level: 0, orderBy: 'priority DESC'});

			const slides = goodsCategories || [];

			
			const dataViews = {
				slides,
				user: {},
				locals: {},
			};
			
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