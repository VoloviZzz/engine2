const db = require("../../db");

module.exports.getRoutes = (args = { id: '' }) => {
    return new Promise(function (resolve, reject) {
        let id = args.id;

        if (!!id === true) id = `AND r.id = ${id}`;

        db.execQuery(`
            SELECT r.*,
                t.title as template_title,
                t.name as template_name
            FROM routes r
                LEFT JOIN templates t ON r.template_id = t.id
            WHERE r.id > 0 
                ${id}`,
            function (err, rows) {
                if (err) return resolve([err, null]);
                if (!!id === true) rows = rows[0];

                return resolve([err, rows]);
            });
    })
}

module.exports.addRoutes = ({ url, title, dynamic, public, name }) => {
    return new Promise(function (resolve, reject) {
        if (!!url === false || !!title === false) return resolve([{ message: 'Отсутствуют необходимые параметры для добавления маршрута' }])

        if (typeof dynamic != 'undefined') dynamic = `, dynamic = ${dynamic}`;
        if (typeof public != 'undefined') public = `, public = ${public}`;
        if (typeof name != 'undefined') name = `, name = '${name}'`;

        app.db.query(`INSERT INTO routes SET url = '${url}', title = '${title}' ${dynamic} ${public} ${name}`, async function (err, rows) {
            if (err) return resolve([err, null]);

            const [queryErr, newRoute] = await getRoutes({ id: rows.insertId });

            return resolve([null, newRoute]);
        })
    })
}

module.exports.delRoutes = ({ id }) => {
    return new Promise(function (resolve, reject) {
        if (!!id === false) return reject([{ message: 'Отсутствует параметр id' }]);

        app.db.query(`DELETE FROM routes WHERE id = ${id}`, function (err, rows) {
            if (err) return resolve([err]);

            return resolve([null, rows]);
        })
    })
}

module.exports.updRoutes = (arg = {}) => {
    return new Promise((resolve, reject) => {

        if (!!arg.id === false) return resolve([{ message: 'Отсутствует параметр id' }]);

        arg.title = !!arg.title === true ? `, title = '${arg.title}'` : ``;
        arg.url = !!arg.url === true ? `, url = '${arg.url}'` : ``;
        arg.name = !!arg.name === true ? `, name = '${arg.name}'` : ``;
        arg.dynamic = typeof arg.dynamic !== 'undefined' ? `, dynamic = '${arg.dynamic}'` : ``;
        arg.public = typeof arg.public !== 'undefined' ? `, public = '${arg.public}'` : ``;

        app.db.query(`UPDATE routes SET created = NOW() ${arg.title} ${arg.url} ${arg.name} ${arg.dynamic} ${arg.public} WHERE id = ${arg.id}`, (err, rows) => {
            if (err) return resolve([err, null]);

            return resolve([null, rows]);
        })
    })
}