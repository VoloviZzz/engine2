const db = require('../libs/db');

exports.get = async (arg = {}) => {
	return db.execQuery(`
		SELECT c.*,
			fb.title as block_title
		FROM components c
			LEFT JOIN fragments_blocks fb ON fb.id = c.block_id
	`);
}

exports.getComponentBlocks = async (data = {}) => {
	return db.execQuery(`SELECT * FROM fragments_blocks`);
}