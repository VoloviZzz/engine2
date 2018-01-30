const path = require('path');
const Model = require('../../models');

module.exports = (app) => {
    return (data = {}) => {
        return new Promise(async (resolve, reject) => {

			let object_id, object_alias;
			let goodsPositions = [];
			let goodsCategories = [];

            if (data.locals.dynamicRouteAlias) {
                object_alias = data.locals.dynamicRouteAlias;
            }
            else {
                object_id = data.locals.dynamicRouteNumber;
            }

            if (!!object_id === false && !!object_alias === false) return resolve([, "Отсутствует аргумент для динамического фрагмента страницы"])

            const dataViews = {
                user: {},
                locals: {},
            };

            if (object_alias) {
                [, aliases] = await Model.aliases.get({ title: object_alias, target: 'news' });
                if (aliases.length < 1) return resolve([, 'Новость не найдена'])

                news_id = aliases[0].target_id;
            }

            [, categories] = await Model.goodsCategories.get({ id: object_id });
			if (categories.length < 1) return resolve([, 'Категория не найдена']);
			
			[, categoriesByParent] = await Model.goodsCategories.get({ parent_id: object_id });

			[, currentCat]= await Model.goodsCategories.get({ id: object_id });
			dataViews.currentCat = currentCat[0];

			if(categoriesByParent.length > 0) {
				dataViews.tpl = 'cats-list';
				dataViews.data = categoriesByParent;
			}
			else {
				[, goodsPositions] = await Model.goodsPositions.get({ cat_id: object_id });
				dataViews.tpl = 'pos-list';
				dataViews.data = goodsPositions;
			}

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