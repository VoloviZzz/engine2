const Model = require('../models');

exports.search = async (req, res, next) => {
    return await Model.clients.get({ search: req.body.value, limit: 25 }).then(([error, result]) => {
        if (error) return Promise.reject(error);

        return { status: 'ok', data: JSON.stringify(result) };
        // return res.render('components/admin/clients-list', {clients: result || []});
    })
        .catch(error => {
            return res.json({ status: 'bad', message: error.message });
        })
}

exports.toggleAdmin = async (req, res, next) => {
    const { target, value, id } = req.body;
    return await Model.clients.upd({ target, value, id })
        .then(([error, result]) => {
            if (error) return Promise.reject(error);

            return Promise.resolve({ status: 'ok' });
        })
        .catch(error => {
            return { status: 'bad', message: error.message };
        })
}