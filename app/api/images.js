const formidable = require('formidable');
const fs = require('fs-extra');
const url = require('url');
const path = require('path');

exports.upload = function (req, res, next) {

	const getQuery = url.parse(req.url, true).query;
	const form = new formidable.IncomingForm();

	form.uploadDir = req.app.locals.uploadDir;
	form.keepExtensions = true;

	const funcNum = getQuery.CKEditorFuncNum;
	const message = 'Файл загружен на сервер';

	return new Promise((resolve, reject) => {
		form.parse(req, function (err, fields, files) {
			// let responseUrl = files.upload.path;
			let fileParsePath = path.parse(files.upload.path);
			let fileUrl = `/uploads/${fileParsePath.name}${fileParsePath.ext}`;

			// const oldpath = files.upload.path;
			// const newpath = 'E:/upload/' + files.upload.name;

			// fs.rename(oldpath, newpath, function (err) {
			// 	if (err) throw err;

			// 	return resolve();
			// });

			return resolve({ status: 'ok', message: 'test', sendData: `<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(${funcNum}, '${fileUrl}', '${message}');</script>` });
		});
	})
}