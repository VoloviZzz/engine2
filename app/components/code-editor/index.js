const path = require('path');
const fs = require('fs');

module.exports = (app) => {
	const Model = app.Model;
	return async ({ locals, session, dataViews = {} }) => {

		dataViews.template = '---';
		dataViews.routeId = locals.dynamicRouteNumber;
		var [error, component] = await Model.components.get({
			id: locals.dynamicRouteNumber
		});
		dataViews.component = component[0];
		dataViews.files = fs.readdirSync('app/components/'+ dataViews.component.ctrl +'', (err, files) => {return files});
		dataViews.index = fs.readFileSync('app/components/'+ dataViews.component.ctrl +'/index.js').toString();
		dataViews.template = fs.readFileSync('app/components/'+ dataViews.component.ctrl +'/template.ejs').toString();
		dataViews.css = fs.readFileSync('app/public/css/'+dataViews.component.ctrl+'.css').toString();
		dataViews.js = fs.readFileSync('app/public/js/'+ dataViews.component.ctrl +'.js').toString();
		dataViews.user = session.user;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);
				return resolve([err, str]);
			});
		})
	}
}
