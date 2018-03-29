exports.addItem = async (req, res, next) => {
	const Model = req.app.Model;
	return Model.news.add({ creator: req.session.user.id }).then(([error, rows]) => {
		if (error) return { message: error.message }
		return { status: 'ok' };
	})
}

exports.deleteItem = (req, res, next) => {
	const Model = req.app.Model;
	return Model.news.del({ id: req.body.id }).then(([error, rows]) => {

		if (error) return { message: error.message }
		return { status: 'ok' };
	})
}

exports.upd = (req, res, next) => {
	const Model = req.app.Model;
	return Model.news.upd(req.body).then(([error, rows]) => {
		if (error) return { message: error.message, error }
		return { status: 'ok' };
	})
}