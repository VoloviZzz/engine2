const path = require('path');

module.exports = (app) => {

	return (data = {}) => {

		app.locals.postRoutes['/api/routes/add'] = async () => {
			const [err, route] = await addRoutes(req.body);

			if (err) return next(err);

			app.locals.routesList[route.url] = route;

			return res.redirect(req.body.url);
		};

		app.locals.postRoutes['/api/routes/del'] = async () => {
			const routeId = req.body.id;

			if (!!routeId === false) return res.json({ status: 'bad', message: 'Отсутствует параметр id' });

			const [getErr, route] = await getRoutes({ id: routeId });
			if (getErr) return next({ status: 'bad', message: 'Что-то пошло не так', error: getErr });
			if (!!route === false) return next({ status: 'bad', message: 'Маршрут не найден' });

			const [err, rows] = await delRoutes(req.body);
			if (err) return res.json({ status: 'bad', message: 'Что-то пошло не так', err });

			delete app.locals.routesList[route.url];

			return res.json({ status: 'ok' });
		};

		app.locals.postRoutes['/api/routes/upd'] = async () => {
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