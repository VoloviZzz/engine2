const db = require('../libs/db');

exports.get = function ({ id = '', login = '', email = '', password = '', phone = '' }) {
	if (!!id === true) id = `AND c.id = ${id}`;
	if (!!login === true) login = `AND c.login = '${login}'`;
	if (!!email === true) email = `AND c.mail = '${email}'`;
	if (!!password === true) password = `AND c.password = MD5('${password}')`;
	if (!!phone === true) phone = `AND c.phone = '${phone}'`;

	return db.execQuery(`SELECT c.* FROM clients c WHERE c.id > 0 ${id} ${login} ${email} ${password} ${phone}`);
}

exports.create = function ({ email, firstname, surname, patronymic, address, phone, password }) {
	email = email ? `, mail = '${email}'` : '';
	firstname = firstname ? `, firstname = '${firstname}'` : '';
	surname = surname ? `, surname = '${surname}'` : '';
	patronymic = patronymic ? `, patronymic = '${patronymic}'` : '';
	address = address ? `, address = '${address}'` : '';

	return db.execQuery(`
		INSERT INTO clients 
		SET created = NOW(),
			password = MD5(${password}),
			phone = '${phone}'
			${email} 
			${firstname} 
			${surname} 
			${patronymic} 
			${address}
	`);
}