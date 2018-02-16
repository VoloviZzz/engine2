const Model = require('../models');
const md5 = require('md5');

exports.register = async function (req, res, next) {
	const data = req.body;

	if (data.password.length < 6) return { status: 'bad', message: 'Длина пароля не может быть менее 6 символов' };
	if (data.password !== data['check-password']) return { status: 'bad', message: 'Пароли не совпадают' };

	let [errPhone, checkPhone] = await Model.clients.get({ phone: data.phone });
	if (errPhone) return { status: 'bad', message: errPhone.message, error: errPhone };
	if (checkPhone.length > 0) return { status: 'bad', message: 'На данный номер уже есть зарегистрированный пользователь.' }

	let [errMail, checkMail] = await Model.clients.get({ email: data.email })
	if (errMail) return { status: 'bad', message: errMail.message, error: errMail };
	if (checkMail.length > 0) return { status: 'bad', message: 'На данный адрес электронной почты уже есть зарегистрированный пользователь' }

	data.name = `${data.surname} ${data.firstname[0]}.`;

	let client = null;

	return Model.clients.create(data).then(async ([errAdd, addClient]) => {

		if (errAdd) return { status: 'bad', message: errAdd.message, error: errAdd };

		[err, [client]] = await Model.clients.get({ id: addClient });

		return Model.confirmedPhones.get({ phone: client.phone, confirmed: '0' });
	}).then(async ([error, [uncofirmed]]) => {
		let code = null;
		let codeId = null;

		if (!!uncofirmed === true) {
			code = uncofirmed.code;
			codeId = uncofirmed.id;
		} else {
			code = req.app.Helpers.getRandomNumber(6);

			await Model.confirmedPhones.add({ phone: client.phone, code, client_id: client.id }).then(([error, result]) => {
				if (error) return Promise.reject(error);
				codeId = result;
			});
		}

		req.session.registerData = { codeId, code, clientId: client.id };

		return req.app.smsc.send({ phones: req.body.phone, mes: code });
	}).then(() => {
		return { status: 'ok' };
	})
}

exports.confirmRegister = (req, res, next) => {

	let { code } = req.body;

	if (code !== req.session.registerData.code) {
		return { message: 'Код неверный' };
	}

	return Model.confirmedPhones.upd({ target: 'confirmed', value: '1', id: req.session.registerData.codeId }).then(async ([error]) => {
		if (error) {
			console.log(error);
			return { message: 'Ошибка' }
		}

		return Model.clients.upd({ target: 'confirmed', value: '1', id: req.session.registerData.clientId });
	}).then(() => {
		delete req.session.registerData;

		return { status: 'ok' };
	});
}

const mailOptions = {
	from: 'bubl174rus@gmail.com',
	to: '',
	subject: 'Подтверждение регистрации на сайте new.mpkpru.ru',
	href: '#',
	html: ``
};

exports.sendConfirmAgain = (req, res) => {
	const data = req.body;
	if (data.userEmail == '') return { status: 'bad', message: 'Ошибка! Почта не должна оставаться пустой!!!' };

	return Model.clients.get({ email: data.userEmail }).then(([error, user]) => {
		if (user.length == 0 || user === false) {
			return { status: 'bad', message: 'Пользователя с такой почтой не найдено. Проверьте данные, и попробуйте снова.' }
		}

		user = user[0];

		mailOptions.to = data.userEmail;

		const unicHash = md5(user.id);
		// const unicHref = `http://p-z-nt.ru/confirm-email/?t=${unicHash}`;
		const unicHref = `http://localhost:3000/confirm-email/?t=${unicHash}`;

		mailOptions.html = `<span>Для завершения регистрации перейдите по следующей ссылке: </span><a href="${unicHref}">${unicHref}</a>`;

		return sendEmail(mailOptions, req.app.transporter).then(() => {
			return Model.confirmEmails.add({ client_id: user.id, hash: unicHash });
		}).then(() => {
			return { status: 'ok', message: 'Письмо отправлено на почту' }
		}).catch(error => {
			console.log(error);
			return { status: 'bad', message: 'Что-то пошло не так. Попробуйте позже' }
		});
	})
}

function sendEmail(mailOptions, transporter) {
	return new Promise((resolve, reject) => {
		transporter.sendMail(mailOptions, function (error, info) {
			if (error) {
				return reject(error);
			} else {
				return resolve({ status: 'ok' });
			}
		});
	})
}