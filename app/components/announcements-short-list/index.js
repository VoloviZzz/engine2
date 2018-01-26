const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise((resolve, reject) => {

			const dataViews = {
				user: {},
                locals: {},
			};

			Object.assign(dataViews.user, data.locals.user);
			Object.assign(dataViews.locals, data.locals);

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.render(templatePath, dataViews, (err, str) => {
				if(err) console.log(err);
				if(err) return resolve([err, err.toString()]);

	
				return resolve([err, str]);
			});
		})
	}
}