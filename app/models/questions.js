const db = require('../libs/db');

exports.get = (arg = {}) => {

	let type = arg.type ? `AND type = '${arg.type}'` : ``;
	let category_id = arg.category_id ? `AND category_id = ${arg.category_id}` : ``;
	let author = arg.author ? `AND author = ${arg.author}` : ``;
	let public = arg.public ? `AND public = ${arg.public}` : ``;
	let orderBy = arg.orderBy ? `ORDER BY ${arg.orderBy}` : ``;
	let limit = arg.limit ? `LIMIT ${arg.limit}` : ``;

	let q = `
			SELECT q.*
			FROM questions q
			WHERE
				id > 0
				${type}
				${category_id}
				${author}
				${public}
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

}

exports.del = (arg = {}) => {

}