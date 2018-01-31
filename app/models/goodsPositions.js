const db = require('../libs/db');

exports.add = function (data = {}) {

	const defaultData = {
		title: `Новый товар`,
		cat_id: ''
	};

	data = Object.assign(defaultData, data);

	// if (!!data.cat_id !== false) data.cat_id = `, cat_id = ${data.cat_id}`;
	if (!!data.cat_id === false) return Promise.resolve([new Error(`Отсутствует номер категории`), null]);

		return db.insertQuery(`
		INSERT INTO 
			goods_pos 
		SET 
			title = '${data.title}',
			cat_id = '${data.cat_id}',
			created = NOW()
		`);
}

exports.get = function (data = {}) {
	data.cat_id = typeof data.cat_id !== "undefined" ? `AND cat_id = ${data.cat_id}` : ``;
	data.id = typeof data.id !== "undefined" ? `AND id = ${data.id}` : ``;
	return db.execQuery(`
		SELECT * FROM goods_pos
		WHERE
			id > 0
			${data.cat_id}
			${data.id}
	`);
}

exports.upd = function (data = {}) {
	return db.execQuery(`
		UPDATE goods_pos
		SET ${data.target} = '${data.value}'
		WHERE id = ${data.id}
	`);
}

exports.del = function (data = {}) {
	if (!!data.id === false) return Promise.resolve(['Нет параметра id для удаления категории', null]);
	return db.execQuery(`
		DELETE FROM goods_pos
		WHERE id = ${data.id}
	`);
}