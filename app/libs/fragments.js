const Model = require('../models/index');
const path = require('path');

module.exports = (app) => {
	const fragmentsHandler = async (fragment, data) => {
		let errors, fragmentData = {}, content = '';

		try {
			fragment.settings = fragment.settings ? JSON.parse(fragment.settings) : {};
		} catch (error) {
			fragment.settings = {};
		}

		data.locals.fragment = fragment;

		[errors, rows] = await Model.fragments.getFragmentsData({ fragment_id: fragment.id });

		if (rows.length > 0) {
			fragmentData = JSON.parse(rows[0].data);
		}
		else {
			if (fragment.component_config) {
				fragmentData.content = JSON.parse(fragment.component_config);
			}
		}

		if (!!fragment.isStatic === false) {
			Object.assign(data, fragmentData);
			const controllerHandler = await require(path.join(app.componentsPath, fragment.component_ctrl))(app);
			[errors, content] = await controllerHandler(data);
		}
		else {
			content = fragmentData.content.body || '';
		}

		return { id: fragment.id, content, fragment };
	}

	return fragmentsHandler;
}