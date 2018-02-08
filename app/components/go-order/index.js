const path = require('path');

module.exports = (app) => {
	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const cart = session.shoppingCart;

		if (typeof cart === 'undefined' || Object.keys(cart.goods).length < 1) return [, 'Корзина пуста'];

		const ids = Object.keys(cart.goods)
			.map(id => id)
			.join(',');

		let goods = [];
		const goodsList = {};

		if (!!ids === true) {
			goods = await app.Model.goodsPositions.get({ ids });
			goods = goods[1];
		}

		goods.forEach(g => {
			goodsList[g.id] = g;
		})

		let totalCartPrice = 0;
		for (let key in cart.goods) {
			const productInCart = cart.goods[key];
			const productPrice = goodsList[key].price;
			const totalProductPrice = productInCart.countInShopCart * productPrice;
			productInCart.price = totalProductPrice;
			totalCartPrice += totalProductPrice;
		}

		cart.totalPrice = totalCartPrice;

		dataViews.goodsList = goodsList;
		dataViews.userData = {};
		dataViews.cart = cart;
		dataViews.orderData = session.orderData || {};

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}