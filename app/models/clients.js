const db = require('../libs/db');

exports.get = function ({id = '', login = '', email = '', password = '', phone = ''}) {
	if(!!id === true) id = `AND c.id = ${id}`;
	if(!!login === true) login = `AND c.login = '${login}'`;
	if(!!email === true) email = `AND c.mail = '${email}'`;
	if(!!password === true) password = `AND c.password = MD5('${password}')`;
	if(!!phone === true) phone = `AND c.phone = '${phone}'`;

	return db.execQuery(`SELECT c.* FROM clients c WHERE c.id > 0 ${id} ${login} ${email} ${password} ${phone}`);
}