const path = require('path');

module.exports = (app) => {
	const Model = app.Model;
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {

			let object_id, object_alias;

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
				[, aliases] = await Model.aliases.get({ title: object_alias, target: 'goods_pos' });
				if (aliases.length < 1) return resolve([, 'Товар не найден'])

				object_id = aliases[0].target_id;
			}

			var [[error, goodsPropsBindValues], [error, goodsProps], [error, goodsCats]] = await Promise.all([
				Model.goodsPropsBindValues.get({ good_id: object_id }),
				Model.goodsProps.get(),
				Model.goodsCategories.get()
			]);

			dataViews.goodsPropsBindValues = goodsPropsBindValues;
			dataViews.goodsProps = goodsProps;

			const [posError, [pos]] = await app.Model.goodsPositions.get({ id: object_id });
			if (posError) return resolve([, posError.message]);
			if (!!pos === false) return resolve([, 'Страница не найдена']);

			dataViews.position = pos;

			const catsTree = await app.locals.Helpers.buildTree(goodsCats);
			let rootLevelCats = goodsCats.filter(c => c.level == '0');

			let positionCollection = [];

			Object.keys(catsTree).some((cat_id, index) => {
				let cat = catsTree[cat_id];
				positionCollection = [];
				positionCollection.push(cat);
				while (!!cat.childs === true) {

					Object.keys(cat.childs).forEach((cat_id, index) => {
						if (!!cat.childs === false) return false; // заглушка. непонятно почему категория (cat) была undefined
						if (!!cat.childs[cat_id] === false) return false; // заглушка. непонятно почему категория (cat) была undefined
						cat = cat.childs[cat_id];
						positionCollection.push(cat);
					})
				}

				if (cat.id === dataViews.position.cat_id) {
					return true;
				} else {
					positionCollection = [];
				}
			})

			const countSimilarPosts = 5;
			var [error, similarPositions] = await app.db.execQuery(`
				SELECT gp.*,
					CONCAT(p.path, '/prod/', p.name) as prod_path,
					CONCAT(p.path, '/origin/', p.name) as origin_path,
					CONCAT(p.path, '/preview/', p.name) as preview_path
				FROM goods_pos gp
					LEFT JOIN photos p ON p.id = gp.main_photo
				WHERE gp.cat_id = '${pos.cat_id}' AND gp.id <> '${pos.id}' ORDER BY RAND() LIMIT ${countSimilarPosts}`);

			dataViews.similarPositions = similarPositions;
			dataViews.rootLevelCats = rootLevelCats;
			dataViews.position.collection = positionCollection;
			data.locals.route.title = pos.title;

			[error, dataViews.goodsPhotos] = await Model.photos.get({ target: 'goodsPosition', target_id: dataViews.position.id });

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);

			dataViews.partName = pos.service == 0 ? 'goods.ejs' : 'service.ejs';


			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}