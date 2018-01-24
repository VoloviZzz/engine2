const db = require("../libs/db");

exports.get = (args = { id: '' }) => {
    args.id = !!args.id === true ? `AND id = ${args.id}` : ``;
	return db.execQuery(`SELECT * FROM news WHERE id > 0 ${args.id}`);
}