const ShoppingCart = require('../classes/ShoppingCart');
const md5 = require('md5');

exports.setOrderData = (req, res, next) => {
	const { Model } = req.app;
	const data = req.body;

	req.session.orderData = req.body;

	// если пользователь авторизован, то просто пропускаем дальше
	if (!!req.session.user.id === true) {
		return { status: 'ok' };
	}

	// сохраняем данные с формы во временную переменную в сессию, для последующей проверки кода;
	req.session.tempOrderData = req.body;

	// проверяем, является ли номер подтвержденным
	return Model.confirmedPhones.get({ phone: data.phone }).then(async ([error, confirmedPhones]) => {
		let code;

		// если такого номера нет в базе, то создаём новый код и добавляем в  базу
		if (confirmedPhones.length === 0) {
			code = req.app.Helpers.getRandomNumber(6);
			let [, codeId] = await Model.confirmedPhones.add({ phone: data.phone, code });

			// await req.app.smsc.send({ phones: req.body.phone, mes: code });
			
			req.session.tempOrderData.code = code;
			req.session.tempOrderData.codeId = codeId;
			
			return { status: 'confirm phone' }
		}
		// если номер есть в базе, но не подтверждён, то отправить пользователю уже существующий код
		else if (confirmedPhones.length == 1 && confirmedPhones[0].confirmed == '0') {
			
			code = confirmedPhones[0].code;
			codeId = confirmedPhones[0].id;
			
			req.session.tempOrderData.codeId = codeId;
			req.session.tempOrderData.code = code;

			// await req.app.smsc.send({ phones: req.body.phone, mes: code });
			
			return { status: 'confirm phone' }
		}
		// если есть в базе и подтверждён, то просто продолжить
		else if (confirmedPhones.length == 1 && confirmedPhones[0].confirmed == '1') {
			return { status: 'ok' };
		}
	})
}

// подтверждение номера телефона пользователя
exports.confirmPhone = async (req, res, next) => {
	const Model = req.app.Model;

	if (req.body.code == req.session.tempOrderData.code) {
		await Model.confirmedPhones.upd({ id: req.session.tempOrderData.codeId, target: 'confirmed', value: '1' })
		delete req.session.tempOrderData;
		return { status: 'ok' }
	}
	else {
		return { status: 'bad', message: 'Код неверный' };
	}
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

		// return req.app.smsc.send({ phones: req.body.phone, mes: `Заказ успешно оформлен.\nНомер заказа: ${order_id}` })
	}).then(() => {
		shoppingCart.clearCart();
		return { status: 'ok', orderHash }
	}).catch(error => {
		console.log(error);
		return { message: error.message, error }
	})
}