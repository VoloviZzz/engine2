const db = require("../libs/db");

exports.get = (args = { id: '' }) => {
	args.id = !!args.id === true ? `AND id = ${args.id}` : ``;
	return db.execQuery(`SELECT * FROM news WHERE id > 0 ${args.id}`);
}

exports.add = (args = {}) => {
	args.creator = args.creator ? `, creator = ${args.creator}` : '';
	return db.insertQuery(`INSERT INTO news SET created = NOW() ${args.creator}`);
}

exports.del = (arg = {}) => {
	if (typeof arg.id == "undefined") return Promise.resolve([new Error('Нет параметра id')]);
	return db.execQuery(`DELETE FROM news WHERE id = ${arg.id}`);
}

exports.upd = (arg = {}) => {
	if (typeof arg.target == "undefined") return Promise.resolve([new Error('Нет параметра target')]);
	if (typeof arg.value == "undefined") return Promise.resolve([new Error('Нет параметра value')]);
	if (typeof arg.id == "undefined") return Promise.resolve([new Error('Нет параметра id')]);
	
	return db.execQuery(`UPDATE news SET ${arg.target} = '${arg.value}' WHERE id = ${arg.id}`);
}