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

app.use(express.static(path.join(__dirname, 'app', 'public')));
app.set('views', path.join(__dirname, 'app', 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ limit: '2048mb', extended: false }));

app.use(function (req, res, next) {
	req.session = {};
	req.session.user = {};
	req.session.user.id = 1;
	req.session.user.admin = true;
	req.session.user.adminMode = true;
	next();
})

app.db = db;
app.ejs = ejs;
app.express = express;
app.locals.routesList = {};
app.locals.libs = path.join(__dirname, 'app', 'libs');
app.componentsPath = path.join(__dirname, 'app', 'components');

process.on('unhandledRejection', (error) => {
	console.log('unhandledRejection', error);
});

const { initRoutes, addRoutes, getRoutes, delRoutes, updRoutes } = require('./libs/router')(app, db);
const routeHandler = require('./libs/routeHandler')(app, express);

const fragments = require('./libs/fragments')(app);

db.connect(async (err) => {
	if (err) throw err.message;

	app.locals.routesList = await initRoutes();
	app.locals.postRoutes = {
		'/api/fragments/add': async (args = {}) => {
			let error = false;

			if(!!args.route_id === false) return Promise.resolve([{message: 'Отсутствует route_id'}, null]);

			[error, fragmentId] = await fragments.addFragment({route_id: args.route_id});
			if(error) return next(error);

			return Promise.resolve([error, fragmentId]);
		},

		'/api/fragments/upd': async (args ={}) => {
			let error = false;

			if(!!args.value === false || !!args.target === false) return Promise.resolve([{message: 'Отсутствуют необходимые параметры'}, null]);

			[error, fragmentId] = await fragments.updFragment({target: args.target, value: args.value, id: args.fragment_id});
			if(error) return next(error);

			return Promise.resolve([error, fragmentId]);
		}
	};

	db.query('SELECT * FROM components', (err, rows) => {
		if(err) return console.log('Ошибка получения компонентов');

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
		res.status(err.status || 200);

		if(req.xhr) {
			return res.json({message: err.message});
		}
		else {
			return res.render('error');
		}
	});

	app.listen(3000, (err) => {
		if (err) return console.log("Ошибка запуска сервера:" + err.message);
		console.log("Сервер запущен на порту 3000");
	})
})
