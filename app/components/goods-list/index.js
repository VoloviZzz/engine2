const path = require('path');
const Model = require('../../models');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			let news_id, object_alias;
			let goodsPositions = [];
			let goodsCategories = [];

			news_id = data.locals.dynamicRouteNumber;

			if (!!news_id === false) return resolve([, "Отсутствует аргумент для динамического фрагмента страницы"])

			const dataViews = {
				user: {},
				locals: {},
			};

			const getCategoriesParams = {
				id: news_id
			};

			const getCategoriesByParentParams = {
				parent_id: news_id
			};

			if (data.session.user.adminMode == false) {
				getCategoriesParams.public = '1';
				getCategoriesByParentParams.public = '1';
			}

			var [getCatsError, categories] = await Model.goodsCategories.get(getCategoriesParams);
			if (getCatsError) {
				console.log(getCatsError);
				throw new Error(getCatsError);
			};
			if (categories.length < 1) return resolve([, 'Категория не найдена']);

			[, categoriesByParent] = await Model.goodsCategories.get(getCategoriesByParentParams);

			[, [currentCat]] = await Model.goodsCategories.get({ id: news_id });
			dataViews.currentCat = currentCat;

			if (categoriesByParent.length > 0) {
				dataViews.tpl = 'cats-list';
				dataViews.data = categoriesByParent;
			}
			else {
				[, goodsPositions] = await Model.goodsPositions.get({ cat_id: news_id });
				dataViews.tpl = 'pos-list';
				dataViews.data = goodsPositions;
			}

			data.locals.route.title = currentCat.title;

			dataViews.fragment = data.locals.fragment;

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