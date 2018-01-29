const db = require('../libs/db');

exports.add = function (data = {}) {

	const defaultData = {
		title: `Новая категория`
	};

	Object.assign(data, defaultData);

	return db.insertQuery(`
		INSERT INTO 
			goods_cats 
		SET 
			title = '${data.title}',
			created = NOW()`
	);
}

exports.get = function (data = {}) {
	data.parent_id = typeof data.parent_id !== "undefined" ? `AND parent_id = ${data.parent_id}` : ``;
	data.id = typeof data.id !== "undefined" ? `AND id = ${data.id}` : ``;
	return db.execQuery(`
		SELECT * FROM goods_cats
		WHERE
			id > 0
			${data.parent_id}
			${data.id}
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
	if(!!data.id === false) return Promise.resolve(['Нет параметра id для удаления категории', null]);
	return db.execQuery(`
		DELETE FROM goods_cats
		WHERE id = ${data.id}
	`);
}