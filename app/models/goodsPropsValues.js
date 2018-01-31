const db = require('../libs/db');

exports.get = function (arg = {}) {

	arg.prop_id = !!arg.prop_id === true ? `AND prop_id = ${arg.prop_id}` : ``;

	const q = `
			SELECT *
			FROM goods_props_values
			WHERE
				id > 0
				${arg.prop_id}
		`;

	return db.execQuery(q);
}

exports.upd = function (arg = {}) {

}

exports.del = function (arg = {}) {

}

exports.add = function (arg = {}) {

	if (!!arg.title === false || !!arg.prop_id === false) return Promise.reject({ message: 'Отсутствуют необходимые параметры', args: arg })

	const q = `
			INSERT INTO goods_props_values
			SET
				title = '${arg.title}',
				prop_id = '${arg.prop_id}'
		`;

	return db.insertQuery(q);
}
