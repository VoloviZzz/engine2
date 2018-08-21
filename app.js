const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const ejs = require('ejs');
const cookieSession = require('cookie-session');
const favicon = require('serve-favicon');
const fs = require('fs');
const compression = require('compression');

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
app.locals.tempUploadDir = path.join(__dirname, 'app', 'public', 'uploads', 'temp');
app.Helpers = app.locals.Helpers = require('./app/libs/Helpers');

global.DocumentRoot = __dirname;
global.AppRoot = path.join(__dirname, 'app');
app.publicDir = global.PublicDir = path.join(__dirname, 'app', 'public');
app.viewsDir = global.ViewsDir = path.join(__dirname, 'app', 'views');

// imagesPath = 'http://img.p-z-nt.ru/img/';
imagesPath = 'http://system.mpkpru.ru/';

app.smsc = require('./services/sendSms/');
app.transporter = require('./services/sendEmail/');

db.connect(db.MODE_TEST, async (err) => {
	if (err) throw new Error(err);

	// подключение обработчика маршрутов
	const routeHandler = require('./app/libs/routeHandler').Router(app);
	const { initRoutes } = require('./app/libs/router');

	// инициализация списка маршрутов; на выходе будет объект: {route.url: route, ...}
	[err, app.locals.routesList] = await initRoutes();

	var [error, routesList] = await db.execQuery(`SELECT r.*, t.name as template_name FROM routes r LEFT JOIN templates t ON t.id = r.template_id ORDER BY dynamic`);
	var [error, aliasesList] = await db.execQuery(`SELECT a.*, r.url as route_url FROM aliases2 a LEFT JOIN routes2 r ON r.id = a.route_id`);

	routesList = routesList || [];
	aliasesList = aliasesList || [];

	require('./app/libs/routeHandler').setupRoutesList({ routesList, aliasesList });
	
	if (err) throw "Ошибка создания сервера. " + err.message;

	await require('./componentsList')(app);
	await require('./siteConfig')(app);
	await require('./socialLinks')(app);

	const { constructHeaderRows } = require('./app/libs/header-nav');
	app.use(constructHeaderRows);

	app.use(`/api/unloading`, require('./app/unloading'));

	// общие маршруты приложения
	app.use(require('./appRoutes'));

	// контроллер для обработки входящих запросов
	app.use(routeHandler);

	// error handler
	const errorHandler = require('./app/functions/error-handler');
	app.use(errorHandler);

	const server = app.listen(config.web.port, (err) => {
		if (err) return console.log("Ошибка запуска сервера:" + err.message);
		console.log("Сервер запущен на порту " + config.web.port);
	})
});
