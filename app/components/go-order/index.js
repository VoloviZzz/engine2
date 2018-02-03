const path = require('path');

module.exports = (app) => {
	return async ({ locals, session, dataViews = {} }) => {
		// logic...

		const cart = session.user.shoppingCart;

		if(typeof cart === 'undefined') return [, 'Корзина пуста'];

		const ids = Object.keys(cart.goods)
			.map(id => id)
			.join(',');

		let goods = [];
		const goodsList = {};

		if(!!ids === true) {
			goods = await app.Model.goodsPositions.get({ ids });
			goods = goods[1];
		}

		goods.forEach(g => {
			goodsList[g.id] = g;
		})

		let totalCartCoast = 0;
		for(let key in cart.goods) {
			const productInCart = cart.goods[key];
			const productCoast = goodsList[key].coast;
			const totalProductCoast = productInCart.countInShopCart * productCoast;
			totalCartCoast += totalProductCoast;
		}

		cart.totalCoast = totalCartCoast;

		dataViews.goodsList = goodsList;
		dataViews.userData = {};
		dataViews.cart = cart;
		dataViews.orderData = session.orderData || {};
		dataViews.deliveryData = {
			data: {},
		};

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}