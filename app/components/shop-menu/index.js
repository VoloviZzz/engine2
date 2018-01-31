const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise(async (resolve, reject) => {
			const [, goodsCategories] = await app.Model.goodsCategories.get();

			const resultCatsObj = {};

			goodsCategories.forEach((cat) => {
				resultCatsObj[cat.id] = cat;
			})

			const catsTree = getTree(resultCatsObj);

			const dataViews = {
				user: {},
				locals: {},
			};

			dataViews.catsTree = catsTree;

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

function getTree(dataset) {
	let tree = {};


	for (let key in dataset) {
		let node = dataset[key];

		if (!node['parent_id']) {
			tree[key] = node;
		}
		else {
			if (!!dataset[node['parent_id']]['childs'] === false) dataset[node['parent_id']]['childs'] = {};

			dataset[node['parent_id']]['childs'][key] = node;
		}
	}

	return tree;
}