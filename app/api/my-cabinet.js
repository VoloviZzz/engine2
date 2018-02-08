exports.changeInfo = async (req, res, next) => {
	const Model = req.app.Model;
	const { id } = req.session.user;
	const { target, value } = req.body;
	const [, [user]] = await Model.clients.get({ id });
	let newName = ``;

	if (target === 'phone') {
		const [, usersByPhone] = await Model.clients.get({ phone: value });
		if (usersByPhone.length > 0) return { message: 'Не удалось сменить номер телефона. Пользователь с таким номером телефона уже зарегистрирован.' }
	}

	return Model.clients.upd({ target, value, id }).then(async ([error, data]) => {
		if (error) return Promise.reject({ status: 'bad', message: error.message, error });

		if (target === 'surname') {
			newName = `${value} ${user.firstname[0]}.`;
			[error] = await Model.clients.upd({ target: 'name', value: newName, id });
			if (error) return Promise.reject(new Error('Не удалось обновить имя пользователя'));
		} else if (target === 'firstname') {
			newName = `${user.surname} ${value[0]}.`;
			[error] = await Model.clients.upd({ target: 'name', value: newName, id });
			if (error) return Promise.reject(new Error('Не удалось обновить имя пользователя'));
		}

		return Model.clients.get({ id });
	}).then(([, [client]]) => {
		req.session.user.clientName = client.name;
	}).then(() => {
		return { status: 'ok' }
	}).catch(error => {
		return { message: error.message, error }
	})
}