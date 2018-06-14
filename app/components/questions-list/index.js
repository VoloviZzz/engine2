const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const [, cats] = await Model.questions.get({ type: 'category', });
		const [, questions] = await Model.questions.get({ type: 'question', public: '1' });
		const [, questionsNotPublished] = await Model.questions.get({ type: 'question', public: '0' });

		cats.forEach((cat, i) => {
			questions.forEach(q => {
				if (q.category_id == cat.id) {
					if (!cats[i].questions) cats[i].questions = [];
					cats[i].questions.push(q);
				}
			});
		});

		dataViews.cats = cats;
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