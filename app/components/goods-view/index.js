const path = require('path');

/**
 * @param cat array
 * @param id int
 * @return array
 * Получаем массив для хлебных крошек
 */
function breadcrumb(cat, id) {

	//Создаем пустой массив
	const brc = {};

	for (const node of Object.values(cat)) {
		//Проверяем что мы не нашли родителя и не массив пуст
		if (id != 0 && !!cat[id] !== false) {
			//Ищем родителя
			brc[cat[id]['id']] = cat[id]['title'];
			id = cat[id]['parent_id'];
		}
		//Останавливаем цикл
		else break;
	}

	//Возвращаем перевернутый массив с сохранением ключей
	return brc;
}

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

			var goodsCatsObject = goodsCats.reduce((prev, current) => {
				const { id } = current;
				prev[id] = current;
				return prev;
			}, {});

			const breadcrumbNavigation = breadcrumb(goodsCatsObject, pos.cat_id);

			dataViews.breadcrumbNavigation = breadcrumbNavigation;

			// получение похожих позиций;
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
			data.locals.route.title = pos.title;

			var [error, aliases] = await Model.aliases.get({ route_id: data.locals.route.id, params: data.locals.URIparams });
			if (error) {
				throw new Error(error);
			}

			dataViews.aliases = aliases;

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