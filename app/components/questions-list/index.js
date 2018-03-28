const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const [, questions] = await Model.questions.get({public: '1'});
		const [, questionsNotPublished] = await Model.questions.get({public: '0'});

		dataViews.questions = questions || [];
		dataViews.questionsNotPublished = questionsNotPublished || [];
		dataViews.session = session;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}