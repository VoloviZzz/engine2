const db = require('../libs/db');

exports.get = (args = {}) => {
    let { id } = args;
    id = !!id === true ? `AND id = ${id}` : '';
    return db.execQuery(`SELECT * FROM shops_list WHERE id > 0 ${id}`);
}

exports.upd = (args = {}) => {
    if(!!args.target === false) return Promise.resolve([new Error('Отсутствует параметр target')]);
    if(typeof args.value === "undefined") return Promise.resolve([new Error('Отсутствует параметр value')]);
    if(!!args.id === false) return Promise.resolve([new Error('Отсутствует параметр id')]);
    return db.execQuery(`UPDATE shops_list SET ${args.target} = '${args.value}' WHERE id = ${args.id}`);
}

exports.add = (args = {}) => {
    return db.insertQuery(`INSERT INTO shops_list SET created = NOW()`);
}

exports.del = (args = {}) => {
    if(!!args.id === false) return Promise.resolve([new Error('Отсутствует параметр id')]);
    return db.execQuery(`DELETE FROM shops_list WHERE id = ${args.id}`);
}