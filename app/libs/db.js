var mysql = require('mysql')
	, async = require('async')

var PRODUCTION_DB = 'test-routes'
	, TEST_DB = 'test-routes'

exports.MODE_TEST = 'mode_test'
exports.MODE_PRODUCTION = 'mode_production'

var state = {
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

exports.execQuery = function (queryStr) {
	return new Promise((resolve, reject) => {
		exports.get().query(queryStr, (err, rows) => {
			if(err) return resolve([err, null]);
			return resolve([err, rows]);
		})
	})
}

exports.fixtures = function (data) {
	var pool = state.pool
	if (!pool) return done(new Error('Missing database connection.'))

	var names = Object.keys(data.tables)
	async.each(names, function (name, cb) {
		async.each(data.tables[name], function (row, cb) {
			var keys = Object.keys(row)
				, values = keys.map(function (key) { return "'" + row[key] + "'" })

			pool.query('INSERT INTO ' + name + ' (' + keys.join(',') + ') VALUES (' + values.join(',') + ')', cb)
		}, cb)
	}, done)
}

exports.drop = function (tables, done) {
	var pool = state.pool
	if (!pool) return done(new Error('Missing database connection.'))

	async.each(tables, function (name, cb) {
		pool.query('DELETE * FROM ' + name, cb)
	}, done)
}