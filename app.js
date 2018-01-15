const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const ejs = require('ejs');
const cookieSession = require('cookie-session');

const app = express();

const config = require('./config');

const mysql = require('mysql');
const db = mysql.createConnection(config.db);

app.use(express.static(path.join(__dirname, 'app', 'public')));
app.set('views', path.join(__dirname, 'app', 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ limit: '2048mb', extended: false }));
app.use(cookieSession(config.session));

function setDefaultSessionData(req, res, next) {
	req.session.user = {};
	req.session.user.id = false;
	req.session.user.admin = false;
	req.session.user.adminMode = true;
	next();
}

app.use(setDefaultSessionData);

// инизиализация переменных в приложении
app.db = db;
app.ejs = ejs;
app.express = express;
app.locals.routesList = {};
app.locals.libs = path.join(__dirname, 'libs');
app.componentsPath = path.join(__dirname, 'app', 'components');

// обработка необработанных ошибок, возникающий в промисах (unhandled rejection);
process.on('unhandledRejection', (error) => {
	console.log('unhandledRejection', error);
});

const { initRoutes, addRoutes, getRoutes, delRoutes, updRoutes } = require('./libs/router')(app, db);
const routeHandler = require('./libs/routeHandler')(app, express);

const fragments = require('./libs/fragments')(app);

db.connect(async (err) => {
	if (err) throw err.message;

	[err, app.locals.routesList] = await initRoutes();
	if (err) throw "Ошибка создания сервера. " + err.message;

	app.locals.postRoutes = {
		'/api/fragments/add': async (req, res, body) => {
			let error = false;

			if (!!req.body.route_id === false) return Promise.resolve([{ message: 'Отсутствует route_id' }, null]);

			[error, fragmentId] = await fragments.addFragment({ route_id: req.body.route_id });
			if (error) return next(error);

			return Promise.resolve([error, fragmentId]);
		},

		'/api/fragments/upd': async (req, res, next) => {
			let error = false;

			if (!!req.body.value === false || !!req.body.target === false) return Promise.resolve([{ message: 'Отсутствуют необходимые параметры' }, null]);

			[error, fragmentId] = await fragments.updFragment({ target: req.body.target, value: req.body.value, id: req.body.fragment_id });
			if (error) return next(error);

			return Promise.resolve([error, fragmentId]);
		}
	};

	db.query('SELECT * FROM components', (err, rows) => {
		if (err) return console.log('Ошибка получения компонентов');

		app.locals.componentsList = rows;
	})

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
