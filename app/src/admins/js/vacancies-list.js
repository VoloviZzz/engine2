$(document).ready(() => {

	$('.js-vacancies-title-update').on('input', updVacanciesTitle);
	$('.js-vacancies-toggle-public').on('click', toggleVacanciesPublic);
	$('.js-vacancies-delete').on('click', deleteVacancies);
	$('.js-vacancies-add').on('click', addVacancies);
	$('.js-vacanciesText-update').on('change', updVacanciesText);

	const vacanciesId = $('#js-vacancies-id').val();

	function updVacanciesText(e, data) {
		const postData = {
			id: vacanciesId,
			value: data.trim(),
			target: 'text'
		};

		sendRequest('/api/vacancies/upd', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		});
	}

	function updVacanciesTitle() {

		$this = $(this);

		const postData = {
			id: $this.data('id'),
			value: $this.val().trim(),
			target: 'title'
		};

		sendRequest('/api/vacancies/upd', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		});
	}

	function toggleVacanciesPublic() {
		$this = $(this);

		if (confirm('Подвердить действие?') === false) {
			return false;
		}

		const postData = {
			id: $this.data('id'),
			value: $this.val()
		};

		sendRequest('/api/vacancies/togglePublished', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		}).then(() => {
			return location.reload();
		});
	}

	function deleteVacancies() {
		$this = $(this);

		if (confirm('Подвердить действие?') === false) {
			return false;
		}

		const postData = {
			id: $this.data('id'),
		};

		sendRequest('/api/vacancies/del', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		}).then(() => {
			return location.reload();
		});
	}

	function addVacancies() {
		$this = $(this);

		if (confirm('Подвердить действие?') === false) {
			return false;
		}

		const postData = {};

		sendRequest('/api/vacancies/add', postData).then(() => {
			return location.reload();
		}).catch(error => {
			console.log(error.message);
			return alert('Произошла ошибка во время выполнения запроса');
		})
	}

	function sendRequest(url, postData) {
		return new Promise((resolve, reject) => {
			$.post(url, postData).done(data => {
				if (data.status != 'ok') {
					return reject(data);
				}

				return resolve(data);
			}).fail(error => {
				return reject(error);
			});
		})
	}
})