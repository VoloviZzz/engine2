exports.add = (req, res, next) => {
	const Model = req.app.Model;

	return Model.siteConfig.add(req.body).then(async ([error, result]) => {
		if (error) return { message: error.message, error }

		await req.app.siteConfig.refresh();
		return { status: 'ok' };
	})
}

exports.setValue = (req, res, next) => {
	const Model = req.app.Model;
	const { target, value } = req.body;

	return req.app.siteConfig.set({ target, value }).then(async () => {
		await req.app.siteConfig.refresh();
		return { status: 'ok' }
	})
}

exports.delete = (req, res, next) => {
	const Model = req.app.Model;

	return Model.siteConfig.del(req.body).then(async () => {
		await req.app.siteConfig.refresh();
		return { status: 'ok' }
	})
}

exports.upd = (req, res, next) => {
	const Model = req.app.Model;

	return Model.siteConfig.upd(req.body).then(async () => {
		await req.app.siteConfig.refresh();
		return { status: 'ok' }
	})
}