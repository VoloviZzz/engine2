const db = require('../libs/db');

exports.get = function (data = { id: '' }) {
	if (!!data.id === true) data.id = `AND id = ${data.id}`;
	return db.execQuery(`SELECT * FROM photos WHERE id > 0 ${data.id}`);
}

exports.add = function (data = { path: '', name: '' }) {
	if (!!data.path === false) return Promise.resolve([new Error('Отсутствует путь до файла'), null]);
	if (!!data.name === false) return Promise.resolve([new Error('Отсутствует название файла'), null]);
	return db.insertQuery(`INSERT INTO photos SET path = '${data.path}', name = '${data.name}'`);
}