const fs = require('fs');
const glob = require('glob');
const path = require('path');

const WatchIgnorePlugin = require('watch-ignore-webpack-plugin')

function getEntries() {
	return fs.readdirSync('./app/public/js')
		.filter(
			(file) => file.match(/.*\.js$/)
		)
		.map((file) => {
			return {
				name: file.substring(0, file.length - 3),
				path: './app/public/js/' + file
			}
		}).reduce((memo, file) => {
			memo[file.name] = file.path
			return memo;
		}, {})
}

module.exports = {
	entry: getEntries,
	output: {
		path: __dirname + '/dist',
		filename: '[name].js'
	},
	mode: 'development',
	module: {
		rules: [{
			test: /\.js$/,
			use: {
				loader: 'babel-loader',
				options: {
					presets: ['es2015']
				}
			}
		}]
	}
}