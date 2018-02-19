exports['upd'] = (req, res, next) => {
	const { Model } = req.app;
	return Model.vacancies.upd({ target: req.body.target, value: req.body.value, id: req.body.id }).then(data => {
		return { status: 'ok' };
	}).catch(e => {
		console.log('Ошибка во время выполнения запроса');
		console.log(e);
		return { status: 'bad', message: e.message }
	})
}

exports['togglePublished'] = (req, res, next) => {
	const { Model } = req.app;
	return Model.vacancies.upd({ target: 'published', value: req.body.value, id: req.body.id }).then(data => {
		return { status: 'ok' };
	}).catch(e => {
		console.log('Ошибка во время выполнения запроса');
		console.log(e);
		return { status: 'bad', message: e.message }
	})
}

exports['del'] = (req, res, next) => {
	const { Model } = req.app;
	return Model.vacancies.del({ id: req.body.id }).then(data => {
		return { status: 'ok' };
	}).catch(e => {
		console.log('Ошибка во время выполнения запроса');
		console.log(e);
		return { status: 'bad', message: e.message }
	})
}

exports['add'] = (req, res, next) => {
	const { Model } = req.app;
	return Model.vacancies.add({ creator: req.session.userId }).then(([error, resultId]) => {
		if (error) return { message: error.message, error }
		return { status: 'ok' };
	}).catch(e => {
		console.log('Ошибка во время выполнения запроса');
		console.log(e);
		console.log(e);
		return { status: 'bad', message: e.message }
	})
}