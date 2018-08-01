const express = require('express');
const router = express.Router();

const app = express();
const db = require(`../libs/db`);
const Model = require('../models');

const formidable = require('formidable');
const request = require(`request`);
const fs = require('fs');
const path = require('path');

const sendPost = require('./functions/send_post');

const saveImageByUrl = function saveImageByUrl(url, file) {
	return new Promise((resolve, reject) => {
		const stream = request(url).pipe(file);

		stream.on('finish', () => resolve(true));
	})
}

app.set('views', path.join(__dirname, 'views'));

// request.post(`http://es/shop_api/`, { form: { func: 'ping', path: 'ping' } }, (error, response, body) => {	
// 	try {
// 		body = JSON.parse(body);
// 		console.log(body);
// 	} catch (error) {
// 		console.error("Ошибка:");
// 		console.error(error);
// 	}
// })

app.use((req, res, next) => {
	console.log(new Date().toLocaleTimeString(), `Пришёл запрос на адрес: ${req.url}`);
	next();
});

app.get(`/`, (req, res, next) => {
	console.log(res);
	res.render(`info`);
});

app.post('/addConnection', async function addConnection(req, res, next) {
	try {
		const { host, port, siteName: title } = req.body;
		const { status: serverStatus } = await sendPost(`http://${host}:${port}/shop_api/`, { path: `connect-crm`, func: `ping` });

		if (serverStatus !== 'ok') {
			return res.json({ status: 'bad', message: 'На данный момент сервер недоступен' });
		}

		const connectResult = await sendPost(`http://${host}:${port}/shop_api/`, { path: `connect-crm`, func: `connect-crm`, data: JSON.stringify({ host: '25.47.255.136', port: '3000', title }) });

		if (connectResult.status !== 'ok') {
			return res.json({ status: 'bad', message: 'Что-то пошло не так' });
		}

		let { data: crm_id } = connectResult;

		await db.execQuery(`INSERT INTO connected_crm SET title = '${title}', host = '${host}', port = '${port}', crm_id = '${crm_id}'`);

		res.json({ status: 'ok' });
	} catch (error) {
		console.error(`Произошла ошибка`);
		console.error(error);

		res.json({ status: 'bad', ...error });
	}
});

app.post(`/updatePositions`, (req, res, next) => {

	var form = new formidable.IncomingForm();

	form.parse(req, async function (err, fields, files) {
		try {
			const { id, target, value } = JSON.parse(fields.data);
			const targetsWhiteList = ['price', 'count'];

			const targetIsValid = targetsWhiteList.includes(target);

			if (targetIsValid === false) {
				return res.json({ status: 'bad', message: 'Недопустимый параметр target' });
			}

			if (!!value === false && value !== 0 && value !== '') {
				return res.json({ status: 'bad', message: 'Недопустимый параметр value' });
			}

			var [error] = await Model.goodsPositions.upd({ id, target, value });

			if (error) {
				return res.json({ status: 'bad', message: `Ошибка во время выполнения запроса: ${error.message}`, error });
			}

			return res.json({ status: 'ok' });
		} catch (error) {
			res.json({ status: 'bad' });
		}
	});

	form.on('error', (error) => console.log(`Ошибка при получение данных с программы. ${error.message}`));
});

/**
 * Получает от программы ответ на запрос сопряжения
 */
app.post('/connectionResponse', async function connectionResponse(req, res, next) {
	var form = new formidable.IncomingForm();

	form.parse(req, async function (err, fields, files) {
		try {
			const { id, token } = JSON.parse(fields.data);

			console.log(id, token);

			var [error] = await db.execQuery(`UPDATE connected_crm SET token = '${token}' WHERE crm_id = '${id}'`);

			console.log(error);

			return res.json({ status: 'ok' });
		} catch (error) {
			res.json({ status: 'bad' });
		}
	});

	form.on('error', (error) => console.log(`Ошибка при получение данных с программы. ${error.message}`));
});

app.post(`/ping`, (req, res, next) => {
	res.json({ status: 'ok' });
});

app.post(`/getCategories`, (req, res, next) => {
	db.execQuery(`SELECT * FROM goods_cats`).then(([error, rows]) => {
		if (error) return next(error);

		res.json({ status: 'ok', data: rows });
	})
});


app.post(`/addPositions`, function addPositions(req, res, next) {

	var form = new formidable.IncomingForm();

	form.parse(req, async function (err, fields, files) {
		try {

			const positions = JSON.parse(fields.data);
			const returnArray = [];

			for (const position of positions) {
				const { name: title, cat_data: cat_id, description, pos_id, mod_id, count, ph_data: photosStringify, price, sa_id: crm_id } = position;
				const photosArray = photosStringify ? JSON.parse(photosStringify) : [];

				const savePhotoPromises = [];

				for (const photo of photosArray) {
					const photoParse = path.parse(photo.origin);
					const file = fs.createWriteStream(`app/public/uploads/${photoParse.name}${photoParse.ext}`);
					const fileUrl = `http://es${photo.origin}`;
					const savePhotoPromise = saveImageByUrl(fileUrl, file);

					savePhotoPromises.push(savePhotoPromise);
				}

				const savePhotoResult = await Promise.all(savePhotoPromises);

				const [error, id] = await Model.goodsPositions.add({ title, cat_id, description, count, price, pos_id, mod_id, crm_id });

				returnArray.push({ id, pos_id, mod_id });
			}

			console.log(`Запрос успешно завершён`);
			return res.json({ status: 'ok', data: returnArray });
		} catch (error) {
			console.log(`Произошла ошибка`);
			console.log(error);
			return res.json({ status: 'bad', ...error, error });
		}
	});

	form.on('error', (error) => console.log(`Ошибка при получение данных с программы. ${error.message}`));
})

app.use((error, req, res, next) => {
	res.json({ message: error.message, error, status: 'bad' });
})

module.exports = app;