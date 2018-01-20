const db = require('../libs/db');

exports.getMenuItems = function() {
	return db.execQuery("SELECT * FROM menu_items");
}

exports.addMenuItem = function({title, parent_id = null, href}) {
	return db.insertQuery("INSERT INTO menu_items SET ?", {title, parent_id, href});
}

exports.updMenuItem = function() {}