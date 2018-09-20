const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			const getGoodsCategoriesParams = {
				level: 0,
				orderBy: 'priority DESC'
			};

			if (data.session.user.adminMode === false) {
				getGoodsCategoriesParams.public = '1';
			}

			const [, goodsCategories] = await app.Model.goodsCategories.get(getGoodsCategoriesParams);

			const cats = goodsCategories || [];


			const dataViews = {
				cats,
				user: {},
				locals: {},
			};

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