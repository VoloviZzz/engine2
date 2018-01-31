var fs = require('fs'),
	multiparty = require('multiparty'),
	md5 = require('md5'),
	Files = require('./Files'),
	Photos = require('../../config/photos'),
	resizeCrop = require('resize-crop');

const path = require('path');

module.exports = (req, res, next, data = { pathToFolder: path.join(AppRoot, 'public', 'uploads') }) => {
	var form = new multiparty.Form(),		// объект обработки формы
		uploadFile = {		// массив для описания загружаемого файла
			originPath: '',
			prodPath: '',
			previewPath: '',
			name: '',
			type: '',
			size: 0,
			ext: '',
		},
		maxSize = Photos.maxOriginSize,		// максимальный размер загружаемого файла
		supportMimeTypes = Photos.supportedMimeTypes,		// поддерживаемые типы файлов
		errors = [],	// массив для записи ошибок
		result = {},		// результат, отправляемый в браузер
		str = md5(Math.random());	// генерация случайной строки для выбора из неё пути
	let hashPath = [str.substr(0, 2), str.substr(2, 2)];	// выбор пути

	let { pathToFolder } = data; // место сохранения файлов

	pathToFolder = path.join(pathToFolder, hashPath[0]);

	const originPath = path.join(pathToFolder, 'origin'); // путь до исходного изображения
	const prodPath = path.join(pathToFolder, 'prod'); // путь до сжатого изображения
	const previewPath = path.join(pathToFolder, 'preview'); // путь до превью изображения

	const relativePathToFolder = path.relative(AppRoot + '/public', pathToFolder);

	result.url = '/' + relativePathToFolder.split(path.sep).join('/');

	return new Promise((resolve, reject) => {
		Files.exists(pathToFolder)	// проверка существования первой части пути
			.catch(error => {
				throw new Error('Ошибка при проверке существования папки фотосета');
			})
			.then(exists => {
				// создание пути, если он не существует
				if (!exists) return Files.mkdir(pathToFolder);
				else return true;
			})
			.catch(error => {
				throw new Error('Ошибка при создании папки фотосета');
			})
			.then(() => {	// проверка существования папки оригинальных изображений
				return Files.exists(originPath);
			})
			.catch(error => {
				throw new Error('Ошибка при проверке существования папки оригинальных изображений');
			})
			.then(exists => {	// создание пути, если он не существует
				if (!exists) {
					return Files.mkdir(originPath);
				}
				return true;
			})
			.catch(error => {
				throw new Error('Ошибка при создании папки оригинальных изображений');
			})
			.then(() => {	// проверка существования папки сжатых изображений
				// Log.view('Проверка существования папки сжатых изображений');
				return Files.exists(prodPath);
			})
			.catch(error => {
				throw new Error('Ошибка при проверке существования папки сжатых изображений');
			})
			.then(exists => {	// создание пути, если он не существует
				if (!exists) {
					return Files.mkdir(prodPath);
				}
				return true;
			})
			.catch(error => {
				throw new Error('Ошибка при создании папки сжатых изображений');
			})
			.then(() => {	// проверка существования папки превью
				return Files.exists(previewPath);
			})
			.catch(error => {
				throw new Error('Ошибка при проверке существования папки превью');
			})
			.then(exists => {	// создание пути, если он не существует
				if (!exists) {
					return Files.mkdir(previewPath);
				}

				return true;
			})
			.catch(error => {
				throw new Error('Ошибка при создании папки превью');
			})
			.then(() => {	// загрузка файла
				return new Promise((resolve, reject) => {
					// обработчик ошибки
					form.on('error', function (err) {
						console.log('on error')
						// отключение от файловой системы
						if (fs.existsSync(uploadFile.originPath)) {
							fs.unlinkSync(uploadFile.originPath);
							console.log('error');
							reject(new Error('Ошибка загрузки файла'));
						}
					});

					// обработчик завершения загрузки
					form.on('close', function () {
						console.log('on close')
						// если ошибок нет
						if (errors.length == 0) {
							resolve();
						}
						else {
							// если есть ошибки
							// Log.view('При записи файла обнаружены ошибки');
							// удаление из БД записи об изображении

							if (fs.existsSync(uploadFile.originPath)) fs.unlinkSync(uploadFile.originPath);		// отключение от файловой системы

							// отправка результата
							reject({
								status: 'bad',
								errors: errors
							});
						}
					});

					form.on('part', function (part) {		// при начале загрузки

						uploadFile.size = part.byteCount;		// размер загружаемого файла
						uploadFile.type = part.headers['content-type'];		// тип загружаемого файла
						uploadFile.name = part.filename;		// имя загружаемого файла
						uploadFile.name = uploadFile.name.replace(/\s+/g, '_');		// замена пробелов подчеркиваниями

						result.filename = uploadFile.name;

						var ext_arr = part.filename.split('.');		// парсинг расширения
						uploadFile.ext = ext_arr[ext_arr.length - 1];

						uploadFile.originPath = path.join(originPath, uploadFile.name);		// путь загрузки оригинального файла
						uploadFile.prodPath = path.join(prodPath, uploadFile.name);		// путь к сжатому изображению
						uploadFile.previewPath = path.join(previewPath, uploadFile.name);		// путь к превью изображения

						if (uploadFile.size > Photos.maxOriginSize) {		// если размер файла превышает максимально допустимый
							errors.push('Размер файла равен ' + uploadFile.size / 1024 / 1024 + ' при ограничении в ' + (maxSize / 1024 / 1024) + 'MB.');
						}

						if (Photos.supportedMimeTypes.indexOf(uploadFile.type) == -1) {		// если тип файла отсутствует в списке поддерживаемых расширений
							errors.push('Неподдерживаемый тип файла ' + uploadFile.type);
						}

						if (errors.length == 0) {

							// Log.view('Начало записи файла');
							var out = fs.createWriteStream(uploadFile.originPath);		// создание потока записи
							part.pipe(out);		// перенаправление файла в поток
						}
						else {
							// Log.view('При проверке файла обнаружены ошибки - загрузка не будет выполнена');
							part.resume();
						}
					});
					form.parse(req);		// запуск обработки формы
				});
			})
			.catch(error => {
				throw new Error('Ошибка записи файла');
			})
			.then(() => {
				// Создание сжатого изображения
				return new Promise((resolve, reject) => {
					resizeCrop({
						format: uploadFile.ext,
						src: uploadFile.originPath,
						dest: uploadFile.prodPath,
						width: Photos.prodSize.width,
						height: Photos.prodSize.height,
						gravity: 'center',
					}, (err, filePath) => {
						if (err) {
							console.log(err);
							return reject(err);
						}
						else {
							return resolve();
						}
					});
				});
			})
			.catch(error => {
				console.log(error);
				console.log('Ошибка сжатия файла');
			})
			.then(() => {
				// создание превью
				return new Promise((resolve, reject) => {
					resizeCrop({
						format: uploadFile.ext,
						src: uploadFile.prodPath,
						dest: uploadFile.previewPath,
						width: Photos.previewSize.width,
						height: Photos.previewSize.height,
						gravity: 'center',
					}, (err, filePath) => {
						return resolve();
					});
				});
			})
			.catch(error => {
				console.log('Ошибка сжатия файла');
			})
			.then(() => {
				return resolve(result);
			})
			.catch(error => {
				return reject(error);
			});
	})
}