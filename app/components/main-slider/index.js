const path = require('path');

module.exports = (app) => {
	return (data = {}) => {
		return new Promise((resolve, reject) => {
			
			const slides = data.slides || [];

			const dataViews = {
				user: {},
				slides,
				adsList: [],
			};

			Object.assign(dataViews.user, data.locals);

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.ejs.renderFile(templatePath, dataViews, (err, str) => {
				if(err) return resolve([err, null]);
	
				return resolve([err, str]);
			});
		})
	}
}