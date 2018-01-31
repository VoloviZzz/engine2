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

			const [goodsPropsBindValues, goodsProps] = await Promise.all([
				Model.goodsPropsBindValues.get({ good_id: object_id }),
				Model.goodsProps.get()
			]);

			dataViews.goodsPropsBindValues = goodsPropsBindValues[1];
			dataViews.goodsProps = goodsProps[1];

			const [posError, pos] = await app.Model.goodsPositions.get({ id: object_id });
			if (posError) return resolve([, posError.message]);

			dataViews.position = pos[0];

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