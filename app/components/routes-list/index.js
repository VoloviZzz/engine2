const path = require('path');

module.exports = (app) => {

	return (data = {}) => {

		const { initRoutes, addRoutes, getRoutes, delRoutes, updRoutes } = require(path.join(app.locals.libs, 'router.js'))(app);

		app.locals.postRoutes['/api/routes/add'] = async (req, res, next) => {
			const [err, route] = await addRoutes(req.body);

			if (err) return Promise.resolve([err, null]);

			app.locals.routesList[route.url] = route;

			return Promise.resolve([null, route]);
		};

		app.locals.postRoutes['/api/routes/del'] = async (req, res, next) => {
			const routeId = req.body.id;
			let error = false;

			if (!!routeId === false) return Promise.resolve(['Нет параметра routeId', null]);

			[error, route] = await getRoutes({ id: routeId });
			if (error) return Promise.resolve([error, null]);
			if (!!route === false) return Promise.resolve([error, null]);

			[error, rows] = await delRoutes(req.body);
			if (error) return Promise.resolve([error, null]);

			delete app.locals.routesList[route.url];

			return Promise.resolve([null, route]);
		};

		app.locals.postRoutes['/api/routes/upd'] = async (req, res, next) => {
			const routeId = req.body.id;
			let error = false;

			if (!!routeId === false) return Promise.resolve(['Нет параметра routeId', null]);

			[error, route] = await getRoutes({ id: routeId });
			if (error) return Promise.resolve([error, null]);
			if (!!route === false) return Promise.resolve(['Маршрут не найден', null]);

			[error, rows] = await updRoutes(req.body);
			if (error) return Promise.resolve([error, null]);

			[error, route] = await getRoutes({ id: routeId });

			[error, app.locals.routesList] = await initRoutes();

			return Promise.resolve([null, route])
		}

		const templatePath = path.join(__dirname, 'template.ejs');

		const componentsList = app.locals.componentsList;

		return new Promise((resolve, reject) => {
			const template = app.ejs.renderFile(templatePath, { url: data.req.url, routesObj: app.locals.routesList, componentsList }, (err, str) => {
				if (err) return resolve([err, null]);

				return resolve([err, str]);
			});
		})
	}
}