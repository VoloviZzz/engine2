const path = require('path');

module.exports = (app) => {

	const Model = app.Model;

	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const getQuestionsParams = {
			type: 'question'
		};

		const questionsTarget = {
			target: locals.fragment.settings.target || '0'
		};

		const [, cats] = await Model.questions.get({ type: 'category' });

		const [, questions] = await Model.questions.get({ ...getQuestionsParams, ...questionsTarget, public: '1' });
		const [, questionsNotPublished] = await Model.questions.get({ ...getQuestionsParams, ...questionsTarget, public: '0' });

		var [error, questionsTargets] = await Model.questions.getTargets();
		var resCats = [];

		cats.forEach((cat, i) => {

			cat.questions = [];

			questions.forEach(q => {
				if (q.category_id == cat.id) {
					cat.questions.push(q);
				}
			});

			if (cat.questions.length > 0) {
				resCats.push(cat);
			}
		});

		dataViews.cats = resCats;
		dataViews.questions = questions || [];
		dataViews.questionsNotPublished = questionsNotPublished || [];
		dataViews.session = session;
		dataViews.fragment = locals.fragment;
		dataViews.targets = questionsTargets;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}