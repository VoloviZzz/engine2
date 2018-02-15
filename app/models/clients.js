const db = require('../libs/db');

exports.get = function ({ id = '', login = '', email = '', password = '', phone = '', search = '' }) {
	if (!!id === true) id = `AND c.id = ${id}`;
	if (!!login === true) login = `AND c.login = '${login}'`;
	if (!!email === true) email = `AND c.mail = '${email}'`;
	if (!!password === true) password = `AND c.password = MD5('${password}')`;
	if (!!phone === true) phone = `AND c.phone = '${phone}'`;
	search = search ? `
				AND c.phone LIKE '%${search}%' 
				OR c.mail LIKE '%${search}%'
				OR CONCAT(c.surname, ' ', c.firstname, ' ', c.patronymic) LIKE '%${search}%'` : ``;

	return db.execQuery(`SELECT c.* FROM clients c WHERE c.id > 0 ${id} ${login} ${email} ${password} ${phone} ${search}`);
}

exports.create = function ({ email, firstname, surname, patronymic, address, phone, password, name }) {
	email = email ? `, mail = '${email}'` : '';
	firstname = firstname ? `, firstname = '${firstname}'` : '';
	surname = surname ? `, surname = '${surname}'` : '';
	patronymic = patronymic ? `, patronymic = '${patronymic}'` : '';
	address = address ? `, address = '${address}'` : '';
	name = name ? `, name = '${name}'` : '';

	return db.insertQuery(`
		INSERT INTO clients 
		SET created = NOW(),
			password = MD5(${password}),
			phone = '${phone}'
			${email} 
			${firstname} 
			${surname} 
			${patronymic} 
			${address}
			${name}
	`);
}

exports.upd = function ({ target, value, id, queryStr = '' }) {

	let queryData = ``;

	if (!!target === true && !!value === true) {
		queryData = `${target} = '${value}'`;
	}
	else if (!!queryStr === true) {
		queryData = queryStr;
	}

	return db.execQuery(`UPDATE clients SET ${queryData} WHERE id = ${id}`);
}