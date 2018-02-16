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