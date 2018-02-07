const ShoppingCart = require('../classes/ShoppingCart');

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
	const Model = req.app.Model;
	const shoppingCart = new ShoppingCart(req);
	const clientCart = shoppingCart.getCart();

	if (req.session.user && typeof req.session.user.id !== 'undefined') {
		req.body.client_id = req.session.user.id;
	}

	return Model.orders.add(req.body).then(async ([error, order_id]) => {

		for (const good_id of Object.keys(clientCart.goods)) {
			await Model.ordersGoods.add({ order_id, good_id, count: clientCart.goods[good_id].countInShopCart });
		}

		if (error) return { message: error.message, error, sql: error.sql }
		return { status: 'ok' }
	});
}