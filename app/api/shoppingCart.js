class ShoppingCart {
	constructor(req) {
		this.cart = this.init(req);
	}

	init(req) {
		if (!!req.session.user === false) req.session.user = {};
		if (req.session.user.shoppingCart) return req.session.user.shoppingCart;

		return req.session.user.shoppingCart = {
			totalCountGoods: 0,
			totalCoast: 0,
			goods: {}
		};
	}

	getCart() {
		return this.cart;
	}

	addToCart(someProduct = {}) {
		this.cart.totalCountGoods++;

		if (typeof this.cart.goods[someProduct.id] !== 'undefined') {
			this.cart.goods[someProduct.id].countInShopCart = this.cart.goods[someProduct.id].countInShopCart + 1;
		}
		else {
			this.cart.goods[someProduct.id] = someProduct;
			this.cart.goods[someProduct.id].countInShopCart = 1;
		}
	}

	remove(product_id) {
		if (typeof this.cart.goods[product_id] === 'undefined') {
			return false;
		}

		const productCount = this.getProductCount(product_id);

		if (productCount > 1) {
			this.setProductCount(product_id, productCount - 1);
		}
		else if (productCount == 1) {
			delete this.cart.goods[product_id];
		}
		else {
			return false;
		}
	}

	getProductCount(product_id) {
		return this.cart.goods[product_id].countInShopCart;
	}

	setProductCount(product_id, count) {
		return this.cart.goods[product_id].countInShopCart = count;
	}

	clearCart() {
		this.cart.totalCountGoods = 0;
		this.cart.goods = {};
	}
}

exports.addToCart = (req, res, next) => {
	const shoppingCart = new ShoppingCart(req);
	const myCart = shoppingCart.getCart();

	shoppingCart.addToCart({ id: req.body.position_id });

	return { data: { cart: myCart } };
}

exports.clearCart = (req, res, next) => {
	const shoppingCart = new ShoppingCart(req);
	const myCart = shoppingCart.getCart();

	shoppingCart.clearCart();

	return { status: 'ok', data: { cart: myCart } }
}

exports.removeFromCart = (req, res, next) => {
	const shoppingCart = new ShoppingCart(req);

	shoppingCart.remove(req.body.position_id);

	return { status: 'ok' }
}