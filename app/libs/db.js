var mysql = require('mysql');

var PRODUCTION_DB = 'test-routes'
	, TEST_DB = 'test-routes'

exports.MODE_TEST = 'mode_test'
exports.MODE_PRODUCTION = 'mode_production'

let state = {
	pool: null,
	mode: null,
}

const config = require('../../config');

exports.connect = function (mode, done) {
	state.pool = mysql.createPool(config.db)

	state.mode = mode
	done()
}

exports.get = function () {
	return state.pool
}

exports.execQuery = function (queryStr, data = false) {
	return new Promise((resolve, reject) => {
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
}

exports.insertQuery = function (queryStr, data = false) {
	return new Promise((resolve, reject) => {

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
}