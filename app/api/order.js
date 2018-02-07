const ShoppingCart = require('../classes/ShoppingCart');
const md5 = require('md5');

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
	let order_id = false;

	if (req.session.user && typeof req.session.user.id !== 'undefined') {
		req.body.client_id = req.session.user.id;
	}

	if (Object.keys(clientCart.goods).length < 1) return { message: 'Не выбрано ни одного товара.' }

	const orderHash = md5(Date.now() + JSON.stringify(req.body));

	req.body.hash = orderHash;
	req.body.price = clientCart.totalPrice;

	return Model.orders.add(req.body).then(async ([error, orderId]) => {
		if (error) return { message: error.message, error, sql: error.sql }

		order_id = orderId;

		for (const good_id of Object.keys(clientCart.goods)) {
			const goodsItem = clientCart.goods[good_id];
			const [error] = await Model.ordersGoods.add({ order_id, good_id, count: goodsItem.countInShopCart, price: goodsItem.price });
			if (error) console.log(error);
		}

		// return smsc.send({ phones: req.body.phone, mes: `Заказ успешно оформлен.\nНомер заказа: ${order_id}` })
	}).then(() => {
		shoppingCart.clearCart();
		return { status: 'ok', orderHash }
	}).catch(error => {
		console.log(error);
		return { message: error.message, error }
	})
}