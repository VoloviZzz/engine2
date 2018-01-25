const db = require('./db');

exports.getHeaderNav = function () {
    return db.execQuery("SELECT * FROM header_nav");
};

exports.addHeaderNav = function () {
    return db.insertQuery(`INSERT INTO header_nav SET created = NOW()`);
}

exports.deleteHeaderNav = function ({ id }) {
    return db.execQuery(`DELETE FROM header_nav WHERE id = ${id}`);
}

exports.updateHeaderNav = function ({ id, target, value }) {
    return db.execQuery(`UPDATE header_nav SET ${target} = '${value}' WHERE id = ${id}`);
}