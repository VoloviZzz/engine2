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

    if (!!req.body.value === false || !!req.body.target === false) return { status: 'bad', message: 'Отсутствуют необходимые параметры' };

    [error, fragmentId] = await Model.fragments.upd({ target: req.body.target, value: req.body.value, id: req.body.fragment_id });
    if (error) return { status: 'bad', message: error.message, error }

    return { status: 'ok' }
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