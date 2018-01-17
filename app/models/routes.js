const db = require("../libs/db");

exports.get = (args = { id: '' }) => {
    return new Promise(async function (resolve, reject) {
        let id = args.id;

        if (!!id === true) id = `AND r.id = ${id}`;

        let [err, rows] = await db.execQuery(`
            SELECT r.*,
            t.title as template_title,
            t.name as template_name
            FROM routes r
            LEFT JOIN templates t ON r.template_id = t.id
            WHERE r.id > 0 ${id}`
        );

        if(err) throw new Error(err);

        if(!!id === true) rows = rows[0];

        resolve([null, rows]);
    })
}

exports.add = ({ url, title, dynamic, access, name }) => {
    return new Promise(async function (resolve, reject) {
        if (!!url === false || !!title === false) return resolve([{ message: 'Отсутствуют необходимые параметры для добавления маршрута' }])

        if (typeof dynamic != 'undefined') dynamic = `, dynamic = ${dynamic}`;
        if (typeof access != 'undefined') access = `, access = ${access}`;
        if (typeof name != 'undefined') name = `, name = '${name}'`;

        const [err, rows] = await db.execQuery(`INSERT INTO routes SET url = '${url}', title = '${title}' ${dynamic} ${access} ${name}`);
        const [queryErr, newRoute] = await exports.get({ id: rows.insertId });
        return resolve([null, newRoute]);
    })
}

exports.del = ({ id }) => {
    return new Promise(function (resolve, reject) {
        if (!!id === false) return reject([{ message: 'Отсутствует параметр id' }]);

        const res = db.execQuery(`DELETE FROM routes WHERE id = ${id}`);

        resolve(res);
    })
}

exports.upd = (arg = {}) => {
    return new Promise((resolve, reject) => {

        if (!!arg.id === false) return resolve([{ message: 'Отсутствует параметр id' }]);

        arg.title = !!arg.title === true ? `, title = '${arg.title}'` : ``;
        arg.url = !!arg.url === true ? `, url = '${arg.url}'` : ``;
        arg.name = !!arg.name === true ? `, name = '${arg.name}'` : ``;
        arg.dynamic = typeof arg.dynamic !== 'undefined' ? `, dynamic = '${arg.dynamic}'` : ``;
        arg.public = typeof arg.public !== 'undefined' ? `, public = '${arg.public}'` : ``;

        return db.execQuery(`UPDATE routes SET created = NOW() ${arg.title} ${arg.url} ${arg.name} ${arg.dynamic} ${arg.public} WHERE id = ${arg.id}`)
    })
}