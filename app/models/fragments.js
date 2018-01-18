const db = require('../libs/db');

exports.get = async (arg = {}) => {

	arg.route_id = !!arg.route_id === true ? `AND f.route_id = ${arg.route_id}` : '';

	const fragments = await db.execQuery(`
            SELECT f.*,
                c.title as component_title,
                c.name as component_name,
                c.ctrl as component_ctrl,
                c.type as component_type,
                c.styles as component_styles,
                c.scripts as component_scripts,
                c.static as isStatic,
                c.default_config as component_config,
                c.once
            FROM fragments f
                LEFT JOIN components c ON f.component_id = c.id
            WHERE f.id > 0 
                ${arg.route_id}
            ORDER BY f.priority DESC, f.id ASc`
	)

	return Promise.resolve(fragments);
}

exports.getFragmentsData = async (arg = { id: false, fragment_id: false }) => {

	arg.id = !!arg.id === true ? `AND id = ${arg.id}` : '';
	arg.fragment_id = !!arg.fragment_id === true ? `AND fragment_id = ${arg.fragment_id}` : '';

	const fragmentsData = await db.execQuery(`
            SELECT *
            FROM fragments_data
            WHERE id > 0
                ${arg.id}
                ${arg.fragment_id}
        `)

	return Promise.resolve(fragmentsData)
}

exports.setData = async function ({ fragment_id, data }) {
	let err;
	[err, fragmentData] = await exports.getFragmentsData({ fragment_id })
	if (err) throw new Error(err);

	if (fragmentData.length < 1) {
		[err, insertId] = await db.insertQuery("INSERT INTO fragments_data SET ?", { fragment_id, data: JSON.stringify({ content: data }) });
		console.log(err);
	}
	else {
		[err, insertId] = await db.execQuery("UPDATE fragments_data SET data = ? WHERE fragment_id = ?", [JSON.stringify({ content: data }), fragment_id]);
		console.log(err);
	}
}

exports.add = async (args = {}) => {
	const res = await db.execQuery(`INSERT INTO fragments SET route_id = ${args.route_id}`);
	return Promise.resolve(res);
}

exports.upd = async (args = {}) => {
	const res = await db.execQuery(`UPDATE fragments SET ${args.target} = ${args.value} WHERE id = ${args.id}`);
	return Promise.resolve(res);
}

exports.delete = function ({ id }) {
	return db.execQuery(`DELETE FROM fragments WHERE id = ${id}`);
}