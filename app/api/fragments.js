const Model = require('../models');

exports.add = async function (req, res, next) {
	let error = false;

	if (!!req.body.route_id === false) return { status: 'bad', message: 'Отсутствует route_id' };

	[error, fragmentId] = await Model.fragments.add({ route_id: req.body.route_id, component_id: 8, block_id: req.body.block_id });
	if (error) return { status: 'bad', message: error.message, error }

	return { status: 'ok' }
}

exports.upd = async function (req, res, next) {
	let error = false;

	if ('value' in req.body === false || 'target' in req.body === false) return { status: 'bad', message: 'Отсутствуют необходимые параметры' };

	[error, fragmentId, sql] = await Model.fragments.upd({ target: req.body.target, value: req.body.value, id: req.body.fragment_id });
	if (error) {
		console.error(error);
		return { status: 'bad', message: error.message, error }
	}

	return { status: 'ok' }
}

exports.updSettings = async function (req, res, next) {
	try {
		let error = false;

		if ('value' in req.body === false || 'target' in req.body === false) return { status: 'bad', message: 'Отсутствуют необходимые параметры' };

		[error, [fragment]] = await Model.fragments.get({ id: req.body.fragment_id });
		if (error) return { status: 'bad', message: error.message, error }

		if (!!fragment.settings === true) {
			let _settings = JSON.parse(fragment.settings);
			fragment.settings = _settings;
		} else {
			fragment.settings = {};
		}

		Object.assign(fragment.settings, { [req.body.target]: req.body.value });

		[error, fragmentId] = await Model.fragments.upd({ target: 'settings', value: JSON.stringify(fragment.settings), id: fragment.id });
		if (error) return { status: 'bad', message: error.message, error }

		return { status: 'ok' }
	} catch (error) {
		return { status: 'bad', error, message: error.message };
	}
}

exports.del = async function (req, res, next) {
	let error = false;

	if (!!req.body.fragment_id === false) return { status: 'bad', message: 'Отсутствуют необходимые параметры' };

	[error, fragmentId] = await Model.fragments.delete({ id: req.body.fragment_id });
	if (error) return { status: 'bad', message: error.message, error }

	return { status: 'ok' }
}

exports.setData = async function (req, res, next) {
	const data = JSON.parse(req.body.data);
	const [queryErr, queryRes] = await Model.fragments.setData({ fragment_id: req.body.fragment_id, data });
	if (queryErr) throw new Error(queryErr);

	return { status: 'ok', body: req.body }
}