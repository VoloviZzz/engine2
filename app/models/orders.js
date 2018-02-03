const db = require('../libs/db');

exports.add = function (data) {
	let { surname, firstname, patronymic, mail, phone, deliveryMethod, paymentMethod } = data;

	if(!!patronymic === true) patronymic = `, patronymic = '${patronymic}'`;
	if(!!mail === true) mail = `, email = '${mail}'`;

	return db.insertQuery(`
		INSERT INTO orders SET 
			surname = '${surname}', 
			firstname = '${firstname}', 
			phone = '${phone}', 
			deliveryMethod = '${deliveryMethod}', 
			paymentMethod = '${paymentMethod}'
			${mail}
			${patronymic}
	`);
}