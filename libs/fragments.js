const path = require('path');

module.exports = (app) => {

    const db = app.db;

    const getFragments = (arg = {}) => {
        return new Promise((resolve, reject) => {

            arg.route_id = !!arg.route_id === true ? `AND f.route_id = ${arg.route_id}` : '';

            db.query(`
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
                ORDER BY f.priority DESC, f.id ASc`,
                (err, rows) => {
                    if (err) return resolve([err, null]);

                    return resolve([null, rows]);
                })
        })
    }

    const getFragmentsData = (arg = { id: false, fragment_id: false }) => {
        return new Promise((resolve, reject) => {

            arg.id = !!arg.id === true ? `AND id = ${arg.id}` : '';
            arg.fragment_id = !!arg.fragment_id === true ? `AND fragment_id = ${arg.fragment_id}` : '';


            db.query(`
                SELECT *
                FROM fragments_data
                WHERE id > 0
                    ${arg.id}
                    ${arg.fragment_id}
            `, (err, rows) => {
                    if (err) return resolve([err, null]);
                    return resolve([null, rows])
                })
        })
    }

    const addFragment = (args = {}) => {
        return new Promise((resolve, reject) => {
            db.query(`
                INSERT INTO fragments SET route_id = ${args.route_id}
            `, (err, rows) => {
                    if (err) return resolve([err, null]);

                    return resolve([null, rows.insertId]);
                })
        })
    }

    const updFragment = (args = {}) => {
        return new Promise((resolve, reject) => {
            db.query(`
                UPDATE fragments SET ${args.target} = ${args.value} WHERE id = ${args.id}
            `, (err, rows) => {
                    if (err) return resolve([err, null]);

                    return resolve([null, rows]);
                })
        })
    }

    const fragmentsHandler = async (fragment, data) => {
        let errors, fragmentData = {}, content = '';

        [errors, rows] = await getFragmentsData({ fragment_id: fragment.id });
        if (rows.length > 0) fragmentData = JSON.parse(rows[0].data);

        if(!!fragment.isStatic === false) {

            Object.assign(data, fragmentData);

            
            const controllerHandler = await require(path.join(app.componentsPath, fragment.component_ctrl))(app);
            [errors, content] = await controllerHandler(data);
            // testVar = await controllerHandler(data);
            // console.log(testVar);
        }
        else {
            content = fragmentData.content || '';
        }

        return { id: fragment.id, content, fragment };
    }

    return { getFragments, fragmentsHandler, addFragment, updFragment }
}