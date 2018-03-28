exports.add = (req, res, next) => {
	if (!!req.session.user.id === false) return res.send('Добавление отзывов доступно только авторизованным пользователям');

	const Model = req.app.Model;
	const { text } = req.body;
	const creator = req.session.user.id;

	return Model.reviews.add({ text, creator }).then(([error, results]) => {
		if (error) return { status: 'bad', message: error.message, error };

		return { status: 'ok' };
	})
}

exports.togglePublished = (req, res, next) => {
	const Model = req.app.Model;
	
	const { id, published } = req.body;

	return Model.reviews.upd({ target: 'published', value: published, id }).then(([error, results]) => {
		if (error) return { status: 'bad', message: error.message, error };

		return { status: 'ok' };
	})
}