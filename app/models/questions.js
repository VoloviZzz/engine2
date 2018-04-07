const db = require('../libs/db');

exports.get = (arg = {}) => {

	let type = arg.type ? `AND type = '${arg.type}'` : ``;
	let category_id = arg.category_id ? `AND category_id = ${arg.category_id}` : ``;
	let author = arg.author ? `AND author = ${arg.author}` : ``;
	let public = arg.public ? `AND public = ${arg.public}` : ``;
	let orderBy = arg.orderBy ? `ORDER BY ${arg.orderBy}` : ``;
	let limit = arg.limit ? `LIMIT ${arg.limit}` : ``;
	let id = arg.id ? `AND id = '${arg.id}'` : ``;

	let q = `
			SELECT q.*
			FROM questions q
			WHERE
				id > 0
				${type}
				${category_id}
				${author}
				${public}
				${id}
			${orderBy}
			${limit}
		`;

	return db.execQuery(q);
}

exports.add = (arg = {}) => {

	let question = arg.question.trim();
	let type = `, type = '${arg.type || 'question'}'`;
	let category_id = arg.category_id ? `, category_id = ${arg.category_id}` : ``;
	let author = arg.author ? `, author = ${arg.author}` : ``;
	let answer = arg.answer ? `, answer = '${arg.answer}'` : ``;

	let q = `
		INSERT INTO questions
		SET
			question = '${question}'
			${type}
			${category_id}
			${author}
			${answer}
	`;

	return db.insertQuery(q);
}

exports.upd = (arg = {}) => {
	if (typeof arg.id == 'undefined') return Promise.resolve([new Error('Нет параметра id')]);
	if (typeof arg.target == 'undefined') return Promise.resolve([new Error('Нет параметра target')]);
	if (typeof arg.value == 'undefined') return Promise.resolve([new Error('Нет параметра value')]);
	return db.execQuery(`UPDATE questions SET ${arg.target} = '${arg.value}' WHERE id = ${arg.id}`);
}

exports.del = (arg = {}) => {
	if (typeof arg.id == 'undefined') return Promise.resolve([new Error('Нет параметра id')]);

	return db.execQuery(`DELETE FROM questions WHERE id = '${arg.id}'`);
}