const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const ejs = require('ejs');
const cookieSession = require('cookie-session');
const nodemailer = require('nodemailer');
const favicon = require('serve-favicon');
const fs = require('fs');
const compression = require('compression');

require('x-date');

const app = express();

const config = require('./config');
const db = require('./app/libs/db');

const Model = require('./app/models/index');

app.use(compression());

// app.use(favicon(path.join(__dirname, 'app', 'public', 'favicon.ico')));
app.use(express.static(path.join(__dirname, 'app', 'public')));
app.set('views', path.join(__dirname, 'app', 'views'));
app.set('view engine', 'ejs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
	limit: '2048mb',
	extended: false
}));
app.use(cookieSession(config.session));

const ShoppingCart = require('./app/classes/ShoppingCart');

const setDefaultSessionData = (req, res, next) => {
	const shoppingCart = new ShoppingCart(req);
	req.session.user = req.session.user || {};
	req.session.user.id = req.session.user.id || false;
	req.session.user.admin = req.session.user.admin || false;
	req.session.user.adminMode = req.session.user.adminMode || false;
	req.session.user.root = req.session.user.root || false;

	res.locals.user = Object.assign({}, req.session.user);

	next();
}

const clearSessionData = (req, res, next) => {
	req.session.user = null;
	res.redirect('/');
}

function toggleAdminMode(req, res, next) {
	if (!!req.session.user.admin === false) return res.json({
		status: 'bad',
		message: `Нет доступа к данной функции`
	});

	req.session.user.adminMode = !req.session.user.adminMode;
	res.json({
		status: 'ok'
	});
}

// обработка необработанных ошибок, возникающий в промисах (unhandled rejection);
// не знаю куда его вынести
process.on('unhandledRejection', (error, p) => {
	console.log(error);
	console.error(error.message);

	if (!!error.sql === true) {
		console.log(error.sql);
	}

	fs.appendFileSync(path.join(__dirname, 'logs', 'unhandledRejection-log.log'), new Date().toLocaleString() + ': ' + error.stack + '\n\n');
});

app.use(setDefaultSessionData);

// инизиализация переменных в приложении
app.db = db;
app.ejs = ejs;
app.Model = Model;
app.express = express;
app.locals.routesList = {};
app.locals.libs = path.join(__dirname, 'app', 'libs');
app.componentsPath = path.join(__dirname, 'app', 'components');
app.locals.uploadDir = path.join(__dirname, 'app', 'public', 'uploads');
app.Helpers = app.locals.Helpers = require('./app/libs/Helpers');

global.DocumentRoot = __dirname;
global.AppRoot = path.join(__dirname, 'app');
app.publicDir = global.PublicDir = path.join(__dirname, 'app', 'public');
app.viewsDir = global.ViewsDir = path.join(__dirname, 'app', 'views');

// imagesPath = 'http://img.p-z-nt.ru/img/';
imagesPath = 'http://system.mpkpru.ru/';

global.path = require('path');

const smsc = require('node-smsc')({
	login: 'sandalb',
	password: '5d93ceb70e2bf5daa84ec3d0cd2c731a', // password is md5-hashed implicitly unless "hashed" option is passed.
	hashed: true
})

app.smsc = smsc;

const transporter = nodemailer.createTransport({
	service: 'gmail',
	auth: {
		user: 'bubl174rus@gmail.com',
		pass: 'nikita174Bubl'
	},
	tls: {
		rejectUnauthorized: false
	}
});

app.transporter = transporter;

db.connect(db.MODE_TEST, async (err) => {
	if (err) throw new Error(err);

	// подключение обработчика маршрутов
	const routeHandler = require('./app/libs/routeHandler')(app);
	const { initRoutes } = require('./app/libs/router');

	// инициализация списка маршрутов; на выходе будет объект: {route.url: route, ...}
	[err, app.locals.routesList] = await initRoutes();
	if (err) throw "Ошибка создания сервера. " + err.message;

	await require('./componentsList')(app);
	await require('./siteConfig')(app);
	await require('./socialLinks')(app);

	const { constructHeaderRows } = require('./app/libs/header-nav');
	app.use(constructHeaderRows);

	// общие маршруты приложения
	app.post('/toggle-admin', toggleAdminMode);
	app.get('/logout', clearSessionData);
	app.get('/admin-login', (req, res, next) => {
		res.render('admin-login');
	});

	function checkAdminMiddleware(req, res, next) {
		if (req.session.user.admin) {
			return next();
		} else {
			return next(new Error('Нет доступа'));
		}
	}

	app.get('/admin-logs', checkAdminMiddleware, (req, res, next) => {
		fs.readdir(path.join(__dirname, 'logs'), (error, files) => {
			if (error) {
				return res.send(error);
			}

			res.render('admin-logs', {
				files: files
			});
		})
	});

	app.get('/admin-logs/:logName', checkAdminMiddleware, (req, res, next) => {
		fs.readFile(path.join(__dirname, 'logs', req.params.logName), 'utf8', (error, data) => {
			if (error) {
				return res.send(error);
			}

			res.send(`<pre>${data}</pre>`);
		})
	});

	app.get('/confirm-email', (req, res, next) => {
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

	// контроллер для обработки входящих запросов
	app.use(routeHandler);

	// error handler
	const errorHandler = require('./app/functions/error-handler');
	app.use(errorHandler);

	app.listen(config.web.port, (err) => {
		if (err) return console.log("Ошибка запуска сервера:" + err.message);
		console.log("Сервер запущен на порту " + config.web.port);
	})
})