const path = require('path');
const Model = require('../../models');

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

			const [, goodsCategories] = await Model.goodsCategories.get(getGoodsCategoriesParams);

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
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}