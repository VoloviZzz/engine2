const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const ejs = require('ejs');

const app = express();

const mysql = require('mysql');
const db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'qwer1234',
	database: 'test-routes'
})

app.set('views', path.join(__dirname, 'app', 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ limit: '2048mb', extended: false }));

app.use(function (req, res, next) {
	req.session = {};
	req.session.user = {};
	req.session.user.id = 1;

	next();
})

app.locals.routesList = {};
app.db = db;
app.componentsPath = path.join(__dirname, 'app', 'components');
app.ejs = ejs;
app.express = express;

process.on('unhandledRejection', (error) => {
	console.log('unhandledRejection', error);
});

const { initRoutes, addRoutes, getRoutes, delRoutes, updRoutes } = require('./libs/router')(app, db);
const routeHandler = require('./libs/routeHandler')(app, express);

db.connect(async (err) => {
	if (err) throw err.message;

	app.locals.routesList = await initRoutes();

	app.use(routeHandler);

	app.post('/api/routes/add', async (req, res, next) => {

		const [err, route] = await addRoutes(req.body);

		if (err) return next(err);

		app.locals.routesList[route.url] = route;

		return res.redirect(req.body.url);
	})

	app.post('/api/routes/del', async (req, res, next) => {
		const routeId = req.body.id;

		if (!!routeId === false) return res.json({ status: 'bad', message: 'Отсутствует параметр id' });

		const [getErr, route] = await getRoutes({ id: routeId });
		if (getErr) return next({ status: 'bad', message: 'Что-то пошло не так', error: getErr });
		if (!!route === false) return next({ status: 'bad', message: 'Маршрут не найден' });

		const [err, rows] = await delRoutes(req.body);
		if (err) return res.json({ status: 'bad', message: 'Что-то пошло не так', err });

		delete app.locals.routesList[route.url];

		return res.json({ status: 'ok' });
	})

	app.post('/api/routes/upd', async (req, res, next) => {
		const routeId = req.body.id;
		let err = false;

		if (!!routeId === false) return res.json({ status: 'bad', message: 'Отсутствует параметр id' });

		[err, route] = await getRoutes({ id: routeId });
		if (err) return next({ status: 'bad', message: 'Что-то пошло не так', error: getErr });
		if (!!route === false) return next({ status: 'bad', message: 'Маршрут не найден' });

		[err, rows] = await updRoutes(req.body);
		if (err) return res.json({ status: 'bad', message: 'Что-то пошло не так', err });

		[err, route] = await getRoutes({ id: routeId });

		app.locals.routesList = await initRoutes();

		backUrl = req.header('Referer');
		return res.redirect(backUrl || '/');
	})

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
		res.render('error');
	});

	app.listen(3000, (err) => {
		if (err) return console.log("Ошибка запуска сервера:" + err.message);
		console.log("Сервер запущен на порту 3000");
	})
})
