const db = require('../libs/db');

exports.add = (args = {}) => {
	const { client_name, client_from, client_phone, client_email, message } = args;

	return db.insertQuery(`INSERT INTO feedback (client_name, client_from, client_phone, client_email, message) 
		VALUES ('${client_name}', '${client_from}', '${client_phone}', '${client_email}', '${message}')`);
}

exports.get = (args = {}) => {
	return db.execQuery(`SELECT * FROM feedback ORDER BY id DESC`);
}