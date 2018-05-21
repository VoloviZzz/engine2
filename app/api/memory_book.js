const request = require('request');
const api = require('../memory-book-api');

exports['change-state-item'] = (req, res, next) => {
	req.body.reason = req.body.reason || false;
	changeStateItem(req.body).then(result => {
		if (result.status == 'ok') {
			return res.json({ status: 'ok', data: result });
		}

		return res.json({ status: 'bad', message: result.message });
	}).catch(error => {
		console.log(error);
		return res.json({ status: 'bad', message: error.message });
	})
}

exports['delete-item'] = (req, res, next) => {
	deleteMemoryItem({ target: req.body.target, id: req.body.id }).then(result => {
		return res.json({ status: 'ok', data: result })
	}).catch(error => {
		console.log(error.message);
		return res.json({ status: 'bad', message: error.message, error })
	})
}

exports['alphavite-search'] = (req, res, next) => {
	new Promise((resolve, reject) => {
		request.get(encodeURI(`${api.memoryBookUrl}deads.letter?value=${req.body.value}&part=${req.body.part}`), (error, response, body) => {
			if (error) {
				return reject(error);
			}

			body = JSON.parse(body);
			data.deads = body.body;
			data.countDeads = body.countDeads;
			data.part = req.body.part;
			return resolve(data)
		})
	}).then((data) => {
		return View.render('components/memory-book', 'items-list.ejs', data);
	}).then(content => {
		data.content = content;
		return res.json(data);
	}).catch(error => {
		console.log(error);
		return res.json({ status: 'bad', message: error.message });
	})
}

exports['loadMore'] = (req, res, next) => {
	var data = {};
	return new Promise((resolve, reject) => {
		request.get(encodeURI(`${api.memoryBookUrl}deads?part=${req.body.part}`), (error, response, body) => {
			if (error) {
				return reject(error);
			}

			body = JSON.parse(body);

			data.deads = body[0];
			data.countDeads = body[1];
			data.part = req.body.part;
			return resolve(data)
		})
	}).then((data) => {
		return View.render('components/memory-book', 'items-list.ejs', data);
	}).then(content => {
		data.content = content;
		return { status: 'ok', data };
	}).catch(error => {
		console.log(error);
		return { status: 'bad', message: error.message };
	})
}

exports['search'] = (req, res, next) => {
	new Promise((resolve, reject) => {
		request.get(encodeURI(`${api.memoryBookUrl}method/deads.search?q=${req.body.fullname}&part=${req.body.part}`), (error, response, body) => {
			if (error) {
				return reject(error);
			}

			body = JSON.parse(body);

			data.deads = body.body;
			data.countDeads = body.countDeads.count;
			data.part = req.body.part;
			return resolve(data)
		})
	}).then((data) => {
		return EJS.renderTpl('./views/components/memory_book/items-list.ejs', data);
	}).then(content => {
		data.content = content;
		return res.json(data);
	}).catch(error => {
		console.log(error);
		return res.json({ status: 'bad', message: error.message });
	})
}

function changeStateItem(data) {
	return new Promise((resolve, reject) => {
		const url = encodeURI(`${api.memoryBookUrl}${data.table}.upd`);
		request.post(url, { form: data }, (error, response, body) => {
			if (error) {
				return reject(error);
			}

			try {
				body = JSON.parse(body);
			}
			catch (e) {
				return reject(e);
			}

			return resolve(body)
		})
	})
}

function deleteMemoryItem(args = {}) {
	return new Promise((resolve, reject) => {
		request({
			method: 'POST',
			url: api.memoryBookUrl + 'memory.del',
			form: {
				id: args.id,
				target: args.target
			}
		}, (error, response, body) => {
			if (error) {
				return reject(error);
			}

			try {
				body = JSON.parse(body);
			}
			catch (e) {
				return reject(e);
			}

			return resolve(body);
		})
	})
}