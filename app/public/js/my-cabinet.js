$(document).ready(function (e) {

	const defaultState = {};

	$(".js-masked-phone").mask("+7(999)-999-99-99"); //номер телефона

	$('.form-info').each((i, elem) => {
		let $this = $(elem);

		$this.serializeArray().map(v => {
			defaultState[v.name] = v.value;
		})

	})

	$('.js-my__accept-button').on('click', function (e) {

		if (!confirm('Изменить личные данные?')) return false;

		const $forms = $('.form-info');
		const postArrays = [];
		const postData = {
			ctrl: 'change-user-data'
		}

		$forms.each((i, e) => {

			const $this = $(e);

			$this.serializeArray().map(v => {
				if (defaultState[v.name] == v.value) return false;

				const checkValidRes = checkValid(v.name, v.value);

				if (checkValidRes === false) {
					alert('Недопустимый формат ввода для поля: ' + getRusFiledName(v.name));
					return false;
				}

				postData['target'] = v.name;
				postData['value'] = v.value;

				postArrays.push(new Promise((resolve, reject) => {
					$.post('/api/my-cabinet/changeInfo', postData).done(res => {
						return resolve(res);
					})
				}));
			});
		})

		if (postArrays.length == 0) return false;

		Promise.all(postArrays).then(results => {
			const errorsArray = [];

			results.map(r => {
				if (r.status !== 'ok') {
					errorsArray.push(r);
					return alert(r.message);
				}
			})

			if (errorsArray.length == 0) {
				return location.reload();
			}
		}).catch(error => {
			console.log(error);
		})
	})

	$('#security-form').on('submit', function (e) {
		e.preventDefault();

		const $this = $(this);
		const postData = {
			ctrl: 'change-user-password',
			oldPass: $('#old-password').val().trim(),
			newPass: $('#new-password').val().trim(),
			checkPass: $('#check-password').val().trim()
		}

		if (postData.oldPass == '' || postData.newPass == '' || postData.checkPass == '') {
			return alert('Для смены пароля все поля должны быть заполнены.');
		}

		if (postData.newPass == postData.oldPass) {
			return alert('Старый и новый пароль должны отличаться.');
		}

		if (postData.newPass !== postData.checkPass) {
			return alert('Неверный повторный пароль. Проверьте правильность ввода и попробуйте снова.');
		}

		if (checkValid('password', postData.newPass) === false) {
			return alert('Недопустимые символы при наборе пароля. Допускаются буквы латинского алфавита, а также числа.');
		}

		$.post("", postData).done(result => {
			if (result.status !== 'ok') return alert(result.message);

			location.reload();
		})
	})

	const getRusFiledName = (name) => {
		switch (name) {
			case 'phone':
				return 'Телефон'
				break;
			case 'mail':
				return 'Почта'
				break;
			case 'surname':
				return 'Фамилия'
				break;
			case 'firstname':
				return 'Имя'
				break;
			case 'patronymic':
				return 'Отчество'
				break;
		}
	}

	const checkValid = (type = 'text', value) => {
		let reText = /^[A-Za-zА-Яа-яЁё]+$/;
		let reEmail = /[^@]+@[^@]+\.[a-zA-Z]{2,6}/;
		let rePass = /^[a-zA-Z0-9]+$/;

		let res = false;

		if (type == 'phone') {
			res = true;
		}
		else if (type == 'mail') {
			res = reEmail.test(value)
		}
		else if (type == 'password') {
			res = rePass.test(value)
		}
		else {
			res = reText.test(value);
		}

		return res;
	}
})
