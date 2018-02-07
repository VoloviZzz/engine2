const db = require('../libs/db');

exports.add = function (data) {
	let { surname, firstname, patronymic, mail, phone, deliveryMethod, paymentMethod, client_id } = data;

	patronymic =  typeof patronymic !== "undefined" ? patronymic = `, patronymic = '${patronymic}'` : '';
	client_id =  !!client_id !== false ? client_id = `, client_id = '${client_id}'` : '';
	mail =  typeof mail !== "undefined" ? mail = `, email = '${mail}'` : '';

	return db.insertQuery(`
		INSERT INTO orders SET 
			surname = '${surname}', 
			firstname = '${firstname}', 
			phone = '${phone}', 
			deliveryMethod = '${deliveryMethod}', 
			paymentMethod = '${paymentMethod}'
			${mail}
			${patronymic}
			${client_id}
	`);
}