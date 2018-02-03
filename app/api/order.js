exports.setOrderData = (req, res, next) => {
	req.session.orderData = req.body;
	return { status: 'ok' }
}

exports.setDeliveryData = (req, res, next) => {
	req.session.deliveryData = req.body;
	req.session.deliveryData.data = {};

	return { status: 'ok' }
}

exports.addOrder = (req, res, next) => {
	return req.app.Model.orders.add(req.body).then(([error, data]) => {
		if (error) return { message: error.message, error, sql: error.sql }
		return { status: 'ok' }
	});
}