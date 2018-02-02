exports.setDeliveryData = (req, res, next) => {
	req.session.orderData = req.body;
	return {status: 'ok', message: 'test'}
}