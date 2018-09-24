const db = require('../libs/db');

exports.add = (args = {}) => {
	const data = Object.assign({ title: 'Новая целевая страница' }, args);
	const q = `INSERT INTO routes_targets SET title = '${data.title}'`;
	return db.execQuery(q);
}

exports.get = (args = {}) => {
	const q = `SELECT * FROM routes_targets`;
	return db.execQuery(q);
}

exports.delete = (args = {}) => {
	if (!!args.id === false) {
		console.error('Отсутствует id для удаления');
		return Promise.resolve([new Error('Отсутствует id для удаления')]);
	}

	const q = `DELETE FROM routes_targets WHERE id = '${args.id}'`;
	return db.execQuery(q);
}

exports.update = (args = {}) => {
	if (!!args.id === false) {
		console.error('Отсутствует id для удаления');
		return Promise.resolve([new Error('Отсутствует id для редактирования')]);
	}
	
	if (!!args.target === false) {
		console.error('Отсутствует id для удаления');
		return Promise.resolve([new Error('Отсутствует target для редактирования')]);
	}

	if (!!args.value === false) {
		console.error('Отсутствует id для удаления');
		return Promise.resolve([new Error('Отсутствует value для редактирования')]);
	}

	const q = `UPDATE routes_targets SET ${args.target} = '${args.value}' WHERE id = '${args.id}'`;
	return db.execQuery(q);
}