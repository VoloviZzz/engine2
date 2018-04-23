const formidable = require('formidable');
const fs = require('fs-extra');
const url = require('url');
const path = require('path');

exports.uploadCKeditor = function (req, res, next) {

	const getQuery = url.parse(req.url, true).query;
	const form = new formidable.IncomingForm();

	form.uploadDir = req.app.locals.uploadDir;
	form.keepExtensions = true;

	const funcNum = getQuery.CKEditorFuncNum;
	const message = 'Файл загружен на сервер';

	return new Promise((resolve, reject) => {
		form.parse(req, function (err, fields, files) {
			let fileParsePath = path.parse(files.upload.path);
			let fileUrl = `/uploads/${fileParsePath.name}${fileParsePath.ext}`;

			return resolve({ status: 'ok', message: 'test', sendData: `<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(${funcNum}, '${fileUrl}', '${message}');</script>` });
		});
	})
}

exports.upload = (req, res, next) => {

	const getQuery = url.parse(req.url, true).query;
	const form = new formidable.IncomingForm();

	form.uploadDir = req.app.locals.uploadDir;
	form.keepExtensions = true;

	const message = 'Файл загружен на сервер';

	return new Promise((resolve, reject) => {

		form.on('file', function (field, file) {
			//rename the incoming file to the file's name
			fs.rename(file.path, path.join(form.uploadDir, getQuery.filename || file.name));
		});

		form.parse(req, function (err, fields, files) {
			let fileParsePath = path.parse(files.upload.path);
			let fileUrl = `/uploads/${files.upload.name}`;
			return resolve({ status: 'ok', message: 'test', data: { fileUrl } });
		});
	})
}