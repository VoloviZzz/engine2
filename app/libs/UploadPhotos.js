const { photosConfig } = require("./photosConfig");

var md5 = require('md5')
var resizeCrop = require('resize-crop');
var formidable = require('formidable');

const path = require('path');
const util = require('util');
const fs = require('fs');

const exists = util.promisify(fs.exists);
const mkdir = util.promisify(fs.mkdir);
const rename = util.promisify(fs.rename);

module.exports = (req, data = {}) => {
	data.pathToFolder = data.pathToFolder || path.join(AppRoot, 'public', 'uploads');

	return new Promise((resolve, reject) => {
		const form = new formidable.IncomingForm();		// объект обработки формы

		form.keepExtensions = true;
		form.uploadDir = path.join(process.cwd(), 'app', 'public', 'uploads', 'temp');
		form.maxFileSize = photosConfig.maxOriginSize;

		const result = [];

		/**
		 * Генерирует относительный путь до файла для адресной строки
		 * @param {Object} data объект, передаваемый в экспортируемую функцию
		 * @return {String} путь до файла в адресной строке
		 */
		const generatePhotoUrl = (data) => {
			const str = md5(Math.random()); // генерация случайной строки для выбора из неё пути
			const hashPath = str.substr(0, 2) + str.substr(-2); // выбор пути
			const pathToFolder = path.join(data.pathToFolder, hashPath); // место сохранения файлов
			const relativePathToFolder = path.relative(AppRoot + '/public', pathToFolder);
			const url = '/' + relativePathToFolder.split(path.sep).join('/');
			return url;
		};

		/**
		 * Создаёт новое, отредактированное изображение
		 * @param {String} originPath путь до оригинального изображения
		 * @param {String} destPath путь до нового изображения
		 * @param {Object} config объект с настройками для генерации нового изображения
		 */
		const generateResizeImage = (originPath, destPath, config) => {
			return new Promise((resolve, reject) => {
				resizeCrop({ src: originPath, dest: destPath, width: config.width, height: config.height, gravity: 'center', }, (error, filePath) => {
					if (error) {
						return reject(error);
					}

					return resolve(filePath);
				});
			})
		};

		const formParse = async (error, fields, files) => {

			files = Object.values(files);

			for (const file of files) {

				const url = generatePhotoUrl(data);
				const uploadDir = path.join(process.cwd(), 'app', 'public', url);

				const originDir = path.join(uploadDir, 'origin');
				const prodDir = path.join(uploadDir, 'prod');
				const previewDir = path.join(uploadDir, 'preview');

				const { type, path: filePath } = file;
				const name = path.parse(filePath).base;

				if (await exists(uploadDir) === false) {
					await mkdir(uploadDir);
				}

				if (await exists(originDir) === false) {
					await mkdir(originDir);
				}

				if (await exists(prodDir) === false) {
					await mkdir(prodDir);
				}

				if (await exists(previewDir) === false) {
					await mkdir(previewDir);
				}

				const newFilePath = path.join(originDir, name);
				const prodFile = path.join(prodDir, name);
				const previewFile = path.join(previewDir, name);

				await rename(filePath, newFilePath);

				await generateResizeImage(newFilePath, prodFile, photosConfig.prodSize);
				await generateResizeImage(newFilePath, previewFile, photosConfig.previewSize);

				result.push({ name, type, path: url });
			}

			resolve(result);
		};

		form.onPart = function (part) {
			if (photosConfig.supportedMimeTypes.includes(part.mime)) {
				form.handlePart(part);
			} else {
				console.log('Unsupported file');
			}
		}

		form.on('error', reject);
		form.parse(req, formParse);
	}).then((result) => {
		return result;
	})
}