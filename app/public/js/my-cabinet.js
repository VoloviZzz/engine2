$(document).ready(function (e) {

	const defaultState = {};
	const { getFormData } = new Forms();

	$(".js-masked-phone").mask("+7(999)-999-99-99"); //номер телефона

	$('.form-info').on('submit', function (e) {
		e.preventDefault();
		const url = $(this).attr('action');
		const formData = getFormData(this);
		let validForm = true;

		$(this).serializeArray().map(v => {
			const checkValidRes = checkValid(v.name, v.value);

			if (checkValidRes === false) {
				validForm = false;
				alert('Недопустимый формат ввода для поля: ' + getRusFiledName(v.name));
				delete formData[v.name]
				return false;
			}
		});

		if(validForm === false) return false;

		$.post(url, formData).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
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

		$.post("/api/my-cabinet/changeSecurity", postData).done(result => {
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
