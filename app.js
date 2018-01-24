
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const ejs = require('ejs');
const cookieSession = require('cookie-session');

const app = express();

const config = require('./config');
const db = require('./app/libs/db');

const { Model } = require('./app/models/index');

app.use(express.static(path.join(__dirname, 'app', 'public')));
app.set('views', path.join(__dirname, 'app', 'views'));
app.set('view engine', 'ejs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ limit: '2048mb', extended: false }));
app.use(cookieSession(config.session));

function setDefaultSessionData(req, res, next) {
	req.session.user = req.session.user || {};
	req.session.user.id = req.session.user.id || false;
	req.session.user.admin = req.session.user.admin || false;
	req.session.user.adminMode = req.session.user.adminMode || false;

	next();
}

function clearSessionData(req, res, next) {
	req.session = null;
	
	res.redirect('/');
}

function toggleAdminMode(req, res, next) {
	if(!!req.session.user.admin === false) return res.json({status: 'bad', message: `Нет доступа к данной функции`});
	
	req.session.user.adminMode = !req.session.user.adminMode;
	res.json({status: 'ok'});
}

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
app.locals.Helpers = require('./app/libs/Helpers');

// обработка необработанных ошибок, возникающий в промисах (unhandled rejection);
// не знаю куда его вынести
process.on('unhandledRejection', (error) => {
	console.log('unhandledRejection', error);
});

const fragments = require('./app/libs/fragments')(app);

db.connect(db.MODE_TEST, async (err) => {
	if (err) throw new Error(err);

	// подключение обработчика маршрутов
	const routeHandler = require('./app/libs/routeHandler')(app, express);
	const { initRoutes } = require('./app/libs/router');

	// инициализация списка маршрутов; на выходе будет объект: {route.url: route, ...}
	[err, app.locals.routesList] = await initRoutes();
	if (err) throw "Ошибка создания сервера. " + err.message;

	[err, app.locals.componentsList] = await db.execQuery(`SELECT * FROM components`);

	// общие маршруты приложения
	app.post('/toggle-admin', toggleAdminMode);
	app.get('/logout', clearSessionData);

	// контроллер для обработки входящих запросов
	app.use(routeHandler);

	// catch 404 and forward to error handler
	app.use(function (req, res, next) {
		var err = new Error('Not Found');
		err.status = 404;
		next(err);
	});

	// error handler
	app.use(function (err, req, res, next) {
		// set locals, only providing error in development
		res.locals.message = err.message;
		res.locals.error = req.app.get('env') === 'development' ? err : {};

		// render the error page
		res.status(err.status || 500);

		if (req.xhr) {
			return res.json({ message: err.message });
		}
		else {
			return res.render('error');
		}
	});

	app.listen(config.web.port, (err) => {
		if (err) return console.log("Ошибка запуска сервера:" + err.message);
		console.log("Сервер запущен на порту " + config.web.port);
	})
})