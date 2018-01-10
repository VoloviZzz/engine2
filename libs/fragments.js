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
                    c.default_config as component_config
                FROM fragments f
                    LEFT JOIN components c ON f.component_id = c.id
                WHERE f.id > 0 
                    ${arg.route_id}`,
                (err, rows) => {
                    if (err) return resolve([err, null]);

                    return resolve([null, rows]);
                })
        })
    }

    const getFragmentsData = (arg = {id:false, fragment_id:false}) => {
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
                if(err) return resolve([err, null]);
                return resolve([null, rows])
            })
        })
    }

    const fragmentsHandler = async (fragment, data) => {
        let errors;

        if(fragment.isStatic) {
            [errors, data] = await getFragmentsData({fragment_id: fragment.id});
            return JSON.parse(data[0].data).body.content;
        }

        const controllerHandler = await require(path.join(app.componentsPath, fragment.component_ctrl))(app);
        [err, content] = await controllerHandler(data);
        
        return content;
    }

    return { getFragments, fragmentsHandler }
}