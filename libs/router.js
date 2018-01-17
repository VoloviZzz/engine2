const { Model } = require('../app/models/index');

const db = require('../db');

exports.initRoutes = initRoutes = async () => {

    const routesObj = {};

    let [queryError, routes] = await Model.routes.getRoutes();
    if (queryError) return ([queryError, []]);

    let routesUrls = [];

    routes.map(function (r) {
        routesUrls.push(r.url);

        return routesObj[r.url] = r;
    })

    return [null, routesObj];
}