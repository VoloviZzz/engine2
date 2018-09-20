var mysql = require('mysql');

let state = {
	pool: null,
	mode: null,
}

const config = require('../../config');

exports.connect = () => new Promise((resolve, reject) => {

	// state.pool = mysql.createPool(config.db)
	// state.connection = mysql.createConnection(config.db);
	var connection = mysql.createConnection(config.db);

	connection.connect(error => {
		if (error) {
			return reject(error)
		};

		state.connection = connection;
		return resolve();
	})
})


exports.get = () => state.connection;


exports.execQuery = (queryStr, data = false) => new Promise((resolve, reject) => {
	if (data === false) {
		exports.get().query(queryStr, (err, rows) => {
			if (err) return resolve([err, null, queryStr]);
			return resolve([err, rows, queryStr]);
		})
	} else {
		exports.get().query(queryStr, data, (err, rows) => {
			if (err) return resolve([err, null, queryStr]);
			return resolve([err, rows, queryStr]);
		})
	}
})


exports.insertQuery = (queryStr, data = false) => new Promise((resolve, reject) => {
	if (data === false) {
		exports.get().query(queryStr, (err, rows) => {
			if (err) return resolve([err, null]);
			return resolve([err, rows.insertId]);
		})
	} else {
		exports.get().query(queryStr, data, (err, rows) => {
			if (err) return resolve([err, null]);
			return resolve([err, rows.insertId]);
		})
	}
})
