const path = require('path');

module.exports = (app) => {
	return (args = {}) => {

		const Router = app.express.Router();
	
		Router.post('/api/routes/add', async (req, res, next) => {
	
			const [err, route] = await addRoutes(req.body);
	
			if (err) return next(err);
	
			routesObj[route.url] = route;
	
			return res.redirect(req.body.url);
		})
	
		Router.post('/api/routes/del', async (req, res, next) => {
			const routeId = req.body.id;
	
			if (!!routeId === false) return res.json({ status: 'bad', message: 'Отсутствует параметр id' });
	
			const [getErr, route] = await getRoutes({ id: routeId });
			if (getErr) return next({ status: 'bad', message: 'Что-то пошло не так', error: getErr });
			if (!!route === false) return next({ status: 'bad', message: 'Маршрут не найден' });
	
			const [err, rows] = await delRoutes(req.body);
	
			if (err) return res.json({ status: 'bad', message: 'Что-то пошло не так', err });
	
			delete routesObj[route.url];
	
			return res.json(req.body);
		})
	
		const templatePath = path.join(__dirname, 'template.ejs');

		return new Promise((resolve, reject) => {
			const template = app.ejs.renderFile(templatePath, {url: '/asdasd', routesObj: app.locals.routesList}, (err, str) => {
				if(err) return resolve([err, null]);
	
				return resolve([err, str]);
			});
		})
	}
}