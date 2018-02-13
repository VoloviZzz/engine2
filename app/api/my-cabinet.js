const md5 = require('md5');

exports.changeGeneral = (req, res, next) => {
	const { Model } = req.app;
	const { id } = req.session.user;
	const fields = req.body;

	if(!!fields.surname && !!fields.firstname) {
		fields.name = `${fields.surname} ${fields.firstname[0]}.`;
	}

	const queryStr = Object.keys(fields).map(fieldName => `${fieldName} = '${fields[fieldName]}'`).join(', ');

	return Model.clients.upd({ id, queryStr }).then(async ([error, data]) => {
		if (error) return Promise.reject({ status: 'bad', message: error.message, error });
		return Model.clients.get({ id });
	}).then(([, [client]]) => {
		req.session.user.clientName = client.name;
	}).then(() => {
		return { status: 'ok' }
	}).catch(error => {
		return { message: error.message, error }
	})
}

exports.changePersonal = (req, res, next) => {
	const { Model } = req.app;
	const { id } = req.session.user;
	const fields = req.body;

	const queryStr = Object.keys(fields).map(fieldName => `${fieldName} = '${fields[fieldName]}'`).join(', ');

	return Model.clients.upd({ id, queryStr }).then(([error, results]) => {
		return { status: 'ok' }
	})
}

exports.changeSecurity = async (req, res, next) => {
	const { Model } = req.app;
	const { id } = req.session.user;
	let [, [curClient]] = await Model.clients.get({ id: req.session.user.id });

	if (!!curClient === false) {
		return { status: 'bad', message: 'Ошибка проверки клиента. Сообщите об ошибке на сайте, и попробуйте позже' };
	}

	if (req.body.newPass.length < 6) {
		return { status: 'bad', message: 'Длина пароля должна быть длиньше 6 символов' };
	}

	let encodeBodyOldPass = md5(req.body.oldPass);
	let encodeBodyNewPass = md5(req.body.newPass);

	if (encodeBodyOldPass !== curClient.password) {
		return { status: 'bad', message: 'Неверно набран старый пароль' };
	}

	if (req.body.newPass !== req.body.checkPass) {
		return { status: 'bad', message: 'Неверный повторный пароль. Проверьте правильность ввода и попробуйте снова.' }
	}

	return Model.clients.upd({ id, target: 'password', value: encodeBodyNewPass }).then(([error, results]) => {
		return { status: 'ok' };
	}).catch(e => {
		return { status: 'bad', message: 'Ошибка при изменении данных. Сообщите об ошибке на сайте, и попробуйте позже.' }
	})
}