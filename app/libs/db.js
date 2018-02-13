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

exports.execQuery = function (queryStr, data = {}) {
	return new Promise((resolve, reject) => {
		exports.get().query(queryStr, data, (err, rows) => {
			if (err) return resolve([err, null]);
			return resolve([err, rows]);
		})
	})
}

exports.insertQuery = function (queryStr, data = {}) {
	return new Promise((resolve, reject) => {
		exports.get().query(queryStr, data, (err, rows) => {
			if (err) return resolve([err, null]);
			return resolve([err, rows.insertId]);
		})
	})
}

exports.updateQuery = ({ table = '', data = {}, fields = {} }) => {
	let fieldsStr = Object.keys(fields).map(fieldName => `${fieldName} = '${fields[fieldName]}'`).join(', ');
	let queryStr = `UPDATE \`${table}\` SET ${fieldsStr} WHERE id = ${data.id}`;

	return new Promise((resolve, reject) => {
		exports.get().query(queryStr, {}, (err, rows) => {
			if (err) return resolve([err, null]);
			return resolve([err, rows]);
		})
	})
}