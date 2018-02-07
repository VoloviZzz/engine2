const db = require('../libs/db');

exports.add = (data) => {
	db.insertQuery(`
		INSERT INTO orders_goods SET good_id = ${data.good_id}, order_id = ${data.order_id}, count = ${data.count}
	`);
}