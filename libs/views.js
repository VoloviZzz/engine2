module.exports = function(app) {

    async function render(fileName, template, data) {
        app.ejs.renderFile(fileName, dataViews, (err, str) => {
            if(err) return resolve([err, null]);

            return resolve([err, str]);
        });
    }

    return { render };
}