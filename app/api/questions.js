exports.delQuestion = (req, res, next) => {
	const Model = req.app.Model;

	return Model.questions.del({ id: req.body.id }).then(result => {
		return { status: 'ok' }
	}).catch(e => {
		console.error(e);
		return res.json({ status: 'bad', message: e.message })
	})
}

exports.addQuestion = (req, res, next) => {
	const Model = req.app.Model;

	return Model.questions.add({ question: req.body.question }).then(result => {
		return { status: 'ok' }
	}).catch(error => {
		return res.send(error.toString());
	});

}

exports.changeCategory = (req, res, next) => {
	const Model = req.app.Model;
	if (typeof req.body.id == 'undefined') {
		return res.json({ status: 'bad', message: 'change_category: Не указан id' })
	}

	return Model.questions.upd({ target: 'category_id', value: req.body.value, id: req.body.id }).then(result => {
		return { status: 'ok' };
	}).catch(error => {
		return { status: 'bad', message: 'error' };
	})
}

exports.editAnswer = (req, res, next) => {
	const Model = req.app.Model;
	if (typeof req.body.id == 'undefined') {
		return { status: 'bad', message: 'edit_answer: Не указан id' }
	}

	return Model.questions.upd({ target: 'answer', value: req.body.value, id: req.body.id }).then(result => {
		return { status: 'ok' };
	}).catch(error => {
		return { status: 'bad', message: 'error' };
	})

}

exports.togglePublication = (req, res, next) => {
	const Model = req.app.Model;
	if (typeof req.body.id == 'undefined') {
		return res.json({ status: 'bad', message: 'toggle_publication: Не указан id' })
	}

	return Model.questions.upd({ target: 'public', value: req.body.value, id: req.body.id }).then(result => {
		return { status: 'ok' };
	}).catch(error => {
		return { status: 'bad', message: 'error' };
	})
}