const ShoppingCart = require('../classes/ShoppingCart');

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

exports.editCount = (req, res, next) => {
	const shoppingCart = new ShoppingCart(req);
	const currentCount = shoppingCart.getProductCount(req.body.good_id);
	const newCount = currentCount + +req.body.vector;

	if (newCount < 1) return { message: 'Количество товара не может быть меньше одного' };

	shoppingCart.setProductCount(req.body.good_id, newCount);

	return { status: 'ok' }
}