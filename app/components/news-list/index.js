const path = require('path');
const Model = require('../../models');

module.exports = (app) => {
    return (data = {}) => {
        return new Promise(async (resolve, reject) => {

            const dataViews = {
                user: {},
                locals: {},
            };

            const [, news] = await Model.news.get();

            dataViews.news = news;

            Object.assign(dataViews.user, data.locals.user);
            Object.assign(dataViews.locals, data.locals);

            const templatePath = path.join(__dirname, 'template.ejs');
            const template = app.render(templatePath, dataViews, (err, str) => {
                if (err) return resolve([err, err.toString()]);


                return resolve([err, str]);
            });
        })
    }
}