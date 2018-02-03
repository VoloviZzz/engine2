exports.setOrderData = (req, res, next) => {
	req.session.orderData = req.body;
	return {status: 'ok'}
}

exports.setDeliveryData = (req, res, next) => {
	req.session.deliveryData = req.body;
	req.session.deliveryData.data = {};

	return {status: 'ok'}
}

exports.addOrder = (req, res, next) => {
	console.log(req.body);
	return {status: 'ok'}
}