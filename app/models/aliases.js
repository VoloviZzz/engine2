const db = require('../libs/db');

exports.get = function ({title = '', target = ''}) {
    if(!!title === true) title = `AND title = '${title}'`;
    if(!!target === true) target = `AND target = '${target}'`;
    return db.execQuery(`SELECT * FROM routes_aliases WHERE id > 0 ${title} ${target}`);
}