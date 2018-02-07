const ShoppingCart = require('../classes/ShoppingCart');

const smsc = require('node-smsc')({
	login: 'sandalb',
	password: '5d93ceb70e2bf5daa84ec3d0cd2c731a', // password is md5-hashed implicitly unless "hashed" option is passed.
	hashed: true
})

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
		if (error) return { message: error.message, error, sql: error.sql }

		for (const good_id of Object.keys(clientCart.goods)) {
			await Model.ordersGoods.add({ order_id, good_id, count: clientCart.goods[good_id].countInShopCart });
		}

		return smsc.send({ phones: req.body.phone, mes: `Заказ успешно оформлен.\nНомер заказа: ${order_id}` })
	}).then(() => {
		return { status: 'ok' }
	}).catch(error => {
		console.log(error);
		return { message: error.message, error }
	})
}