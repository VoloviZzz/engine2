var fs = require("fs");
// var ZipLoader = require("ZipLoader");
const db = require('../libs/db');

exports.getZip = (req, res, next) => {
	// var loader = new ZipLoader('/uploads/panorams/files.zip');
	// return loader.load('files.zip://Resources.png');
}
exports.updPanoram = (req, res, next) => {
	return db.insertQuery(`UPDATE panorams SET
		title = "${req.body.title}",
		zip = "${req.body.zip}",
		coord = "${req.body.coord}",
		created = "${req.body.created}"
		WHERE id = ${req.body.id}`)
		 .then(([error, targetId]) => {
		if (error) {
			console.log(error);
			return { message: error.message, error };
		}

		return { status: 'ok', id: targetId };
	})
}
exports.addPanoram = (req, res, next) => {
	return db.insertQuery(`INSERT INTO panorams SET title = "Новая панорама",zip = "Загрузите архив",coord = "53.388019, 59.075146",created = CURRENT_TIMESTAMP()`).then(([error, targetId]) => {
		if (error) {
			console.log(error);
			return { message: error.message, error };
		}

		return { status: 'ok', id: targetId };
	})
}
exports.removePanoram = (req, res, next) => {
	return db.insertQuery(`DELETE FROM panorams WHERE id = ${req.body.id}`).then(([error, targetId]) => {
		if (error) {
			console.log(error);
			return { message: error.message, error };
		}
		return { status: 'ok' };
	})
}
