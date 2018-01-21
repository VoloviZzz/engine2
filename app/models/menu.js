const db = require('../libs/db');

exports.getMenuItems = function({group_id = ''}) {
	if(!!group_id === true) group_id = `AND group_id = ${group_id}`;
	return db.execQuery(`SELECT * FROM menu_items WHERE id > 0 ${group_id}`);
}
exports.getMenuGroups = function() {
	return db.execQuery("SELECT * FROM menu_groups");
}

exports.addMenuItem = function({title, parent_id = null, href, menu_id}) {
	return db.insertQuery("INSERT INTO menu_items SET ?", {title, parent_id, href, group_id: menu_id});
}

exports.deleteMenuItem = function({id}) {
	return db.execQuery("DELETE FROM menu_items WHERE id = ?", [id]);
}

exports.addMenuGroup = function({title}) {
	return db.insertQuery("INSERT INTO menu_groups SET ?", {title});
}

exports.updMenuItem = function() {}