exports.get = (req, res, next) => {
	const Model = req.app.Model;

	return Model.callbacks.get(req.body).then(([error]) => {
		if (error) return { error, message: error.message };
		return { status: 'ok' };
	})
}

exports.update = (req, res, next) => {
	const Model = req.app.Model;

	return Model.callbacks.upd(req.body).then(([error]) => {
		if (error) return { error, message: error.message };
		return { status: 'ok' };
	})
}

exports.changeStatus = (req, res, next) => {
	const Model = req.app.Model;

	return Model.callbacks.upd(req.body).then(([error]) => {
		if (error) return { error, message: error.message };
		return Model.callbacks.upd({target: 'manager_id', value: req.session.user.id, id: req.body.id});
	}).then(([error]) => {
		if (error) return { error, message: error.message };
		return { status: 'ok' };
	});
}

exports.delete = (req, res, next) => {
	const Model = req.app.Model;

	return Model.callbacks.del(req.body).then(([error]) => {
		if (error) return { error, message: error.message };
		return { status: 'ok' };
	})
}

exports.add = (req, res, next) => {
	const Model = req.app.Model;

	if (typeof req.body.clientNumber === 'undefined' || req.body.clientNumber == "") return { message: 'Номер телефона отсутствует' }

	return Model.callbacks.add(req.body).then(([error]) => {
		if (error) return { error, message: error.message };
		return { status: 'ok' };
	})
}