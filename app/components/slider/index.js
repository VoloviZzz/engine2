const path = require('path');

module.exports = (app) => {
	return (args = {}) => {
		return new Promise((resolve, reject) => {
            
            const templatePath = path.join(__dirname, 'template.ejs');

			const template = app.ejs.renderFile(templatePath, {}, (err, str) => {
				if(err) return resolve([err, null]);
	
				return resolve([err, str]);
			});
		})
	}
}