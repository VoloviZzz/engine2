module.exports = async app => {
    const db = require('./libs/db');

    var [error, rows] = await db.execQuery('SELECT * FROM `components` ORDER BY `components`.`title` ASC');
    if (error) throw new Error(error);

    app.componentsList = rows;
    app.componentsObj = {};
    
    componentsObj = app.componentsObj;

   generalComponents = [];

    rows.forEach(component => {
        const { block_id } = component;

        if (!!block_id === false) return generalComponents.push(component);
        if (!!componentsObj[block_id] === false) componentsObj[block_id] = [];
        componentsObj[block_id].push(component);
    })

    Object.keys(componentsObj).forEach(block_id => {
        componentsObj[block_id] = componentsObj[block_id].concat(generalComponents);
    })

    return rows;
}