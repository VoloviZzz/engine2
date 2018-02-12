$(document).ready(() => {

	const State = {
		activeTab: 'login',
		formData: {}
	};

	$("input[name=phone]").mask("+7(999)-999-99-99"); //номер телефона

	$('.login-title__item').on('click', function (e) {
		if ($(this).data("item") == State.activeTab)
			return false;

		$(`.login-title__item[data-item=${State.activeTab}]`).attr("data-select", "false");
		$(this).attr("data-select", "true");

		State.activeTab = $(this).data("item");

		let activeTab = `reg`;

		if (State.activeTab == 'login') {
			activeTab = 'auth';
		}

		$('#login-tabs').attr('data-active', activeTab);
	});

	$('#js-get-new-pass').on('click', function (e) {
		let reEmail = /[^@]+@[^@]+\.[a-zA-Z]{2,6}/;
		let userEmail = prompt('Введите почту, указанную при ригестрации:');

		if (!!userEmail === false)
			return false;

		userEmail = userEmail.trim();

		if (userEmail.length == 0 && userEmail == '' || userEmail === false) {
			return alert('Поле обязательно для заполнения!');
		}

		if (reEmail.test(userEmail) === false)
			return alert('Ошибка! Почта набрана в неправильном формате!!!')

		const postData = { userEmail };

		$.post('/api/get-new-pass/index', postData).done(result => {
			return alert(result.message);
		})
	})

	let registerFormData = {};

	$('#register-form').on('submit', function (e) {
		e.preventDefault();

		let data = {};

		$(this).find('.login-body__input').each((i, elem) => {
			let dataName = $(elem).attr('name');
			let dataValue = $(elem).val();

			data[dataName] = dataValue;
		})

		let reText = /^[A-Za-zА-Яа-яЁё]+$/;
		let reEmail = /[^@]+@[^@]+\.[a-zA-Z]{2,6}/;
		let rePhone = /(\+?\d[- .]*){7,13}/;

		if (data.password !== data['check-password']) {
			return alert('Пароли не совпадают');
		}

		if (data.password.length < 6) {
			return alert('Пароль не может быть меньше 6 символов');
		}

		if (!reText.test(data.firstname) || !reText.test(data.surname) || !reText.test(data.patronymic) || !rePhone.test(data.phone)) {
			return alert('Вводимые данные некоректны');
		}

		if (data.email && !reEmail.test(data.email)) {
			return alert('Вводимые данные некоректны');
		}

		registerFormData = data;

		$.post("/api/register", registerFormData).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
			else {
				$(this).hide();
				$('#confirmRegisterForm').show();
			}
		})
	})

	$('#confirmRegisterForm').on('submit', function (e) {
		e.preventDefault();

		const code = $('#confirmedCode').val();

		$.post("/api/register/confirmRegister", { code }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
			else {

				location.reload();
			}
		})
	})

	$('#auth-form').on('submit', function (e) {
		e.preventDefault();

		let data = {
			ctrl: 'signin'
		};

		$(this).find('.login-body__input').each((i, elem) => {
			let dataName = $(elem).attr('name');
			let dataValue = $(elem).val();

			data[dataName] = dataValue;
		})

		$.post("/api/login", data).done(result => {
			if (result.status == 'ok')
				return location.href = "/";

			if (result.status == 'not confirmed') {
				let sendConfirmAgain = confirm(result.message);

				if (sendConfirmAgain === true) {
					let reEmail = /[^@]+@[^@]+\.[a-zA-Z]{2,6}/;
					let userEmail = prompt('Введите почту, на которую была произведена регистрация:')

					if (userEmail === false)
						return false;

					userEmail = userEmail.trim();

					if (userEmail == "")
						return alert('Ошибка! Почта не должна оставаться пустой!!!');
					if (reEmail.test(userEmail) === false)
						return alert('Ошибка! Почта набрана в неправильном формате!!!')

					return $.post('/api/register/sendConfirmAgain', { userEmail }).done(result => {
						return alert(result.message);
					})
				}
			}
			else {
				return alert(result.message);
			}
		})
	})
})
