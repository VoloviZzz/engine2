const db = require('../libs/db');

exports.get = (data) => {
	return db.execQuery(`
		SELECT *
		FROM global_site_config
		WHERE id > 0
	`);
}

exports.add = (data = {}) => {

	if (!!data.title === false) return Promise.resolve([new Error('Отсутствует параметр title')]);
	if (!!data.target === false) return Promise.resolve([new Error('Отсутствует параметр target')]);
	if (!!data.value === false) return Promise.resolve([new Error('Отсутствует параметр value')]);

	return db.insertQuery(`
		INSERT INTO global_site_config SET title = '${data.title}', target = '${data.target}', value = '${data.value}'
	`);
}

exports.upd = (data = {}) => {

	if (!!data.id === false) return Promise.resolve([new Error('Отсутствует параметр id')]);
	if (!!data.target === false) return Promise.resolve([new Error('Отсутствует параметр target')]);
	if (!!data.value === false) return Promise.resolve([new Error('Отсутствует параметр value')]);

	return db.execQuery(`
		UPDATE global_site_config SET ${data.target} = '${data.value}' WHERE id = '${data.id}'
	`);
}

exports.del = (data = {}) => {
	if (!!data.id === false) return Promise.resolve([new Error('Отсутствует параметр id')]);

	return db.execQuery(`
		DELETE FROM global_site_config WHERE id = '${data.id}'
	`);
}