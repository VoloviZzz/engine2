exports.add = (req, res, next) => {
	const Model = req.app.Model;

	return Model.siteConfig.add(req.body).then(([error, result]) => {
		if (error) return { message: error.message, error }

		return { status: 'ok' };
	})
}

exports.setValue = (req, res, next) => {
	const Model = req.app.Model;
	const { target, value } = req.body;

	return req.app.siteConfig.set({ target, value }).then(() => {
		return { status: 'ok' }
	})
}