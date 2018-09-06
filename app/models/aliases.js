const db = require('../libs/db');

exports.get = function () {
	return db.execQuery(`
		SELECT a.*,
			a.alias as url, 
			r.url as route_url,
			t.title as template_title,
			t.name as template_name
		FROM routes_aliases a 
			LEFT JOIN routes r ON r.id = a.route_id
			LEFT JOIN templates t ON r.template_id = t.id
	`);
}