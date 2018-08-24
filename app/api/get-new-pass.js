const md5 = require('md5');

const mailOptions = {
	from: 'bubl174rus@gmail.com',
	to: '',
	subject: 'Восстановление пароля на сайте',
	href: '#',
	html: ``
};

exports.index = async (req, res) => {
	const Model = req.app.Model;
	const data = req.body;
	let user;

	[, [user]] = await Model.clients.get({ email: data.userEmail });

	if (!!user === false) {
		return { status: 'bad', message: 'Пользователя с такой почтой не найдено. Проверьте данные, и попробуйте снова.' }
	}

	let userNewPass = req.app.Helpers.getRandomNumber(6);
	
	console.log('---------------------');
	console.log(global);
	
	mailOptions.to = data.userEmail;
	mailOptions.html = `<p>Новый пароль для входа на сайт: ${userNewPass}</p>`;
	// mailOptions.subject = 'Восстановление пароля на сайте ' + global.domainName;
	mailOptions.subject = 'Восстановление пароля на сайте';

	let md5Pass = md5(userNewPass);

	return sendEmail(mailOptions, req.app.transporter)
		.then(() => {
			return Model.clients.upd({ target: 'password', id: user.id, value: md5Pass });
		})
		.then(() => {
			return { status: 'ok', message: 'Новый пароль сгенирирован и отправлен на почту' }
		})
		.catch(error => {
			console.log(error);
			return { status: 'bad', message: 'Что-то пошло не так. Попробуйте позже' }
		});
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