const path = require('path');

module.exports = (app) => {
	const Model = app.Model;
	return async ({ locals, session, dataViews = {} }) => {
		// logic...
		const client_id = session.user.id;

		const [errorOrders, orders] = await Model.orders.get({ client_id });

		console.log(errorOrders.sql);

		for (let order of orders) {
			const { id } = order;
			const [, orderGoods] = await Model.ordersGoods.get({ order_id: id });
			order.goods = orderGoods;
		}

		dataViews.orders = orders;

		return new Promise((resolve, reject) => {
			const template = app.render(path.join(__dirname, 'template.ejs'), dataViews, (err, str) => {
				if (err) return resolve([err, err.toString()]);

				return resolve([err, str]);
			});
		})
	}
}