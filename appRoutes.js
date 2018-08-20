const fs = require('fs');
const express = require('express');
const Router = express.Router();
const path = require('path');

const checkAdminMiddleware = (req, res, next) => {
    if (req.session.user.admin) {
        return next();
    } else {
        return next(new Error('Нет доступа'));
    }
}

const clearSessionData = (req, res, next) => {
    req.session.user = null;
    res.redirect(req.header('Referer'));
}

const toggleAdminMode = (req, res, next) => {
    if (!!req.session.user.admin === false) return res.json({
        status: 'bad',
        message: `Нет доступа к данной функции`
    });

    req.session.user.adminMode = !req.session.user.adminMode;
    res.json({
        status: 'ok'
    });
}

Router.post('/toggle-admin', toggleAdminMode);
Router.get('/logout', clearSessionData);

Router.get('/admin-login', (req, res, next) => {
    res.render('admin-login');
});

Router.get('/admin-logs', checkAdminMiddleware, (req, res, next) => {
    fs.readdir(path.join(__dirname, 'logs'), (error, files) => {
        if (error) {
            return res.send(error);
        }

        res.render('admin-logs', {
            files: files
        });
    })
});

Router.get('/admin-logs/:logName', checkAdminMiddleware, (req, res, next) => {
    fs.readFile(path.join(__dirname, 'logs', req.params.logName), 'utf8', (error, data) => {
        if (error) {
            return res.send(error);
        }

        res.sendFile(path.join(__dirname, 'logs', req.params.logName));
    })
});

Router.get('/confirm-email', (req, res, next) => {
    if (!req.query.t) return res.json({
        status: 'bad'
    });

    let clientId;

    return Model.confirmEmails.get({
        hash: req.query.t
    }).then(([error, results]) => {

        if (results.length < 1) {
            return Promise.reject({
                status: 'bad',
                message: 'Неправильный hash'
            });
        }

        return Promise.resolve(results[0]);
    }).then((result) => {
        if (result.checked == '1') {
            return Promise.reject({
                status: 'bad',
                message: 'Почта уже подтвеждена'
            });
        }

        clientId = result.client_id;

        return Promise.resolve(result);
    }).then(result => {
        return Model.confirmEmails.upd({
            target: 'checked',
            value: '1',
            id: result.id
        })
    }).then(() => {
        return Model.clients.upd({
            id: clientId,
            target: 'confirmed',
            value: '1'
        })
    }).then(result => {
        res.redirect('/login');
    }).catch(error => {
        res.json(error);
    })
})


module.exports = Router;