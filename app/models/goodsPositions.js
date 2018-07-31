const db = require('../libs/db');

exports.add = function (data = {}) {

	const defaultData = {
		title: `Новый товар`,
		cat_id: ''
	};

	data = Object.assign(defaultData, data);

	if (!!data.cat_id === false) return Promise.resolve([new Error(`Отсутствует номер категории`), null]);

	const description = data.description ? `, description = '${data.description}'` : '';
	const count = data.count ? `, count = '${data.count}'` : '';
	const price = data.price ? `, price = '${data.price}'` : '';
	const pos_id = data.pos_id ? `, pos_id = '${data.pos_id}'` : '';
	const mod_id = data.mod_id ? `, mod_id = '${data.mod_id}'` : '';
	const crm_id = data.crm_id ? `, crm_id = '${data.crm_id}'` : '';

	return db.insertQuery(`
		INSERT INTO 
			goods_pos 
		SET 
			title = '${data.title}',
			cat_id = '${data.cat_id}'
			${description}
			${count}
			${price}
			${pos_id}
			${mod_id}
			${crm_id}
			, created = NOW()
		`);
}

exports.get = function (data = {}) {
	data.cat_id = typeof data.cat_id !== "undefined" ? `AND gp.cat_id = ${data.cat_id}` : ``;
	data.id = typeof data.id !== "undefined" ? `AND gp.id = ${data.id}` : ``;
	data.ids = typeof data.ids !== "undefined" ? `AND gp.id IN (${data.ids})` : ``;

	return db.execQuery(`
		SELECT gp.*,
			p.path as photo_path,
			p.name as photo_name
		FROM goods_pos gp
			LEFT JOIN photos p ON p.id = gp.main_photo
		WHERE
			gp.id > 0
			${data.cat_id}
			${data.id}
			${data.ids}
	`);
}

exports.upd = function (data = {}) {
	if (!!data.value === false && data.value !== 0 && data.value !== '') return Promise.resolve([new Error('Нет value')])

	const targetIsArray = Array.isArray(data.target);
	let setData = '';

	if (targetIsArray) {
		if (Array.isArray(data.value)) {
			setData = data.target.map((target, index) => `${target} = ${data.value[index]}`).join(',');
		}
		else {
			return Promise.reject([, new Error('Values is not array')]);
		}
	}
	else {
		setData = `${data.target} = '${data.value}'`;
	}

	return db.execQuery(`
		UPDATE goods_pos
		SET ${setData}
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