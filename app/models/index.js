module.exports = function (db) {
    return {
        clients: require('./clients')(this),
        executeQuery: str => {
            return new Promise((resolve, reject) => {
                db.query(str, (err, rows) => {
                    if (err) {
                        return reject(err);
                    }

                    return resolve(rows);
                })
            })
        },
    }
}