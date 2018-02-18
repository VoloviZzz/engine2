exports.updSchedule = (req, res, next) => {
	const Model = req.app.Model;
	req.body.target = req.body.target === 'from' ? 0 : 1;

	return Model.shopsList.get({ id: req.body.shopId }).then(([error, [shop]]) => {
		let shopSchedule = JSON.parse(shop.schedule);

		shopSchedule[req.body.scheduleDay][req.body.target] = req.body.value;
		shopSchedule = JSON.stringify(shopSchedule);

		return Model.shopsList.upd({ id: req.body.shopId, target: 'schedule', value: shopSchedule });
	}).then(() => {
		return { status: 'ok' }
	});
}

exports.update = (req, res, next) => {
	const Model = req.app.Model;
	return Model.shopsList.upd(req.body).then(([error, result]) => {
		if (error) return { message: error.message, error };
		return { status: 'ok' }
	})
}