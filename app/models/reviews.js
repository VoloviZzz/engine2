const db = require('../libs/db');

exports.add = (arg = {}) => {

	const { creator, text } = arg;

	if (!!creator === false) return Promise.resolve([new Error('Отсутствует параметр creator')]);
	if (!!text === false) return Promise.resolve([new Error('Отсутствует параметр text')]);

	const q = `
		INSERT INTO reviews
		SET
			client_id = ${creator},
			text = '${text}'
	`;

	return db.insertQuery(q);
}

exports.get = (arg = {}) => {

	let { id, public, client_id, targetType, targetId, limit } = arg;

	id = !!id === true ? `AND r.id = '${id}'` : ``;
	client_id = !!client_id === true ? `AND r.client_id = '${client_id}'` : ``;
	public = typeof public !== "undefined" ? `AND r.published = '${public}'` : ``;
	targetType = typeof targetType !== 'undefined' ? `AND r.target_type = '${targetType}'` : ``;
	targetId = !!targetId === true ? `AND r.target_id = '${targetId}'` : ``;
	limit = !!limit === true ? `LIMIT ${limit}` : ``;

	var q = `
		SELECT r.*,
			c.name as clientName
		FROM reviews r
			LEFT JOIN clients c ON r.client_id = c.id
		WHERE r.id > 0
			${id}
			${public}
			${targetType}
			${targetId}
		ORDER BY r.created DESC
		${limit}
	`;

	return db.execQuery(q);
}

exports.upd = (arg = {}) => {

	if (!!arg.target === false) return Promise.resolve([new Error('Отсутствует параметр arg.target')]);
	if (!!arg.value === false) return Promise.resolve([new Error('Отсутствует параметр arg.value')]);
	if (!!arg.id === false) return Promise.resolve([new Error('Отсутствует параметр arg.id')]);

	const q = `UPDATE reviews SET ${arg.target} = '${arg.value}' WHERE id = ${arg.id}`;

	return db.execQuery(q);
}

exports.del = (arg = {}) => {

	if (!!arg.id === false) return Promise.resolve([new Error('Отсутствует параметр id')]);

	var q = `
		DELETE FROM reviews
		WHERE id = ${arg.id}
	`;

	return db.execQuery(q);
}