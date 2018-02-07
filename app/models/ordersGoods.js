const db = require('../libs/db');

exports.get = (data) => {
	let { id, order_id } = data;

	id = typeof id !== 'undefined' ? `AND og.id = '${data.id}'` : '';
	order_id = typeof order_id !== 'undefined' ? `AND og.order_id = '${data.order_id}'` : '';

	return db.execQuery(`
		SELECT og.*,
			gp.title as goods_title
		FROM orders_goods og
			LEFT JOIN goods_pos gp ON gp.id = og.good_id
		WHERE og.id > 0
			${id}
			${order_id}
	`);
}

exports.add = (data) => {
	if(!!data.good_id === false) return Promise.reject([new Error('Отсутствует параметр id')]);
	if(!!data.order_id === false) return Promise.reject([new Error('Отсутствует параметр id')]);
	if(!!data.count === false) return Promise.reject([new Error('Отсутствует параметр id')]);
	if(!!data.price === false) return Promise.reject([new Error('Отсутствует параметр id')]);

	return db.insertQuery(`
		INSERT INTO orders_goods SET good_id = ${data.good_id}, order_id = ${data.order_id}, count = ${data.count}, price = ${data.price}
	`);
}