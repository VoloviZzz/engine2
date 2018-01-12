const path = require('path');

module.exports = (app) => {
	return (args = {}) => {
		return new Promise((resolve, reject) => {
			
			const slides = [
				{title: 'test', description: 'desc test', img: 'http://new.mpkpru.ru/img/main_slides/17.jpg'},
				{title: 'test', description: 'desc test', img: 'http://new.mpkpru.ru/img/main_slides/17.jpg'},
			];

			const dataViews = {
				user: {},
				slides,
				adsList: [],
			};

			Object.assign(dataViews.user, args.locals);

			const templatePath = path.join(__dirname, 'template.ejs');
			const template = app.ejs.renderFile(templatePath, dataViews, (err, str) => {
				if(err) return resolve([err, null]);
	
				return resolve([err, str]);
			});
		})
	}
}