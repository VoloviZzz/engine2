const Model = require('../models');

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

    let [errAdd, addClient] = await Model.clients.create(data);
    if (errAdd) return { status: 'bad', message: errAdd.message, error: errAdd };

    [err, client] = await Model.clients.get({ id: addClient.insertId });

    return { status: 'ok', data: { client } };
}