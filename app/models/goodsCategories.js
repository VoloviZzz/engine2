const db = require('../libs/db');

exports.add = function (data = {}) {

	const defaultData = {
		title: `Новая категория`,
		level: '0',
		parent_id: ''
	};

	data = Object.assign(defaultData, data);

	if(!!data.parent_id) data.parent_id = `, parent_id = '${data.parent_id}'`

	return db.insertQuery(`
		INSERT INTO 
			goods_cats 
		SET 
			created = NOW(),
			title = '${data.title}',
			level = '${data.level}'
			${data.parent_id}
	`);
}

exports.get = function (data = {}) {
	data.parent_id = typeof data.parent_id !== "undefined" ? `AND parent_id = ${data.parent_id}` : ``;
	data.id = typeof data.id !== "undefined" ? `AND id = ${data.id}` : ``;
	data.level = typeof data.level !== "undefined" ? `AND level = ${data.level}` : ``;
	return db.execQuery(`
		SELECT * FROM goods_cats
		WHERE
			id > 0
			${data.parent_id}
			${data.id}
			${data.level}
	`);
}

exports.upd = function (data = {}) {
	return db.execQuery(`
		UPDATE goods_cats
		SET ${data.target} = '${data.value}'
		WHERE id = ${data.id}
	`);
}

exports.del = function (data = {}) {
	if (!!data.id === false) return Promise.resolve(['Нет параметра id для удаления категории', null]);
	return db.execQuery(`
		DELETE FROM goods_cats
		WHERE id = ${data.id}
	`);
}