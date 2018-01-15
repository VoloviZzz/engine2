
module.exports = function(databaseConfig) {
    const mysql = require('mysql');
    const db = mysql.createConnection(databaseConfig);
    
    return {
        connect() {
            db.connect((connectionError) => {
                if(connectionError) return Promise.resolve([connectionError, null]);

                return Promise.resolve([null, true]);
            })
        }
    };
}