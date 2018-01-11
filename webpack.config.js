const path = require('path');
const glob = require('glob');

module.exports = {
    context: __dirname,
    // entry: glob.sync('./app/public/src/*.js'),
    entry: {
        admin: './app/public/src/admin.js'
    },
    output: {
        filename: '[name].bundle.js',
        path: path.join(__dirname, 'app', 'public', 'dist'),
    },
    devtool: "source-map",
};