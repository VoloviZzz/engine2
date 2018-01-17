const Model = require('../models');

module.exports = function (req, res, next) {
    async function add() {
        let error = false;

        if (!!req.body.route_id === false) return Promise.resolve([{ message: 'Отсутствует route_id' }, null]);

        [error, fragmentId] = await Model.fragments.addFragment({ route_id: req.body.route_id });
        if (error) return next(error);

        return Promise.resolve([error, fragmentId]);
    }

    async function upd() {
        let error = false;

        if (!!req.body.value === false || !!req.body.target === false) return Promise.resolve([{ message: 'Отсутствуют необходимые параметры' }, null]);

        [error, fragmentId] = await Model.fragments.updFragment({ target: req.body.target, value: req.body.value, id: req.body.fragment_id });
        if (error) return next(error);

        return Promise.resolve([error, fragmentId]);
    }

    async function del() {
        let error = false;

        if (!!req.body.fragment_id === false) return Promise.resolve([{ message: 'Отсутствуют необходимые параметры' }, null]);

        [error, fragmentId] = await Model.fragments.delete({ id: req.body.fragment_id });
        if (error) return next(error);

        return Promise.resolve([error, fragmentId]);
    }
}