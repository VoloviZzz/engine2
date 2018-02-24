$(document).ready(() => {

	$('.js-documents-title-update').on('input', updDocumentTitle);
	$('.js-documents-toggle-public').on('click', toggleDocumentPublic);
	$('.js-documents-delete').on('click', deleteDocument);
	$('.js-documents-add').on('click', addDocument);
	$('.js-documentsText-update').on('change', updDocumentText);

	const documentId = $('#js-document-id').val();

	function updDocumentText(e, data) {
		const postData = {
			id: documentId,
			value: data.trim(),
			target: 'text'
		};

		sendRequest('/api/documents/upd', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		});
	}

	function updDocumentTitle() {

		$this = $(this);

		const postData = {
			id: $this.data('id'),
			value: $this.val().trim(),
			target: 'title'
		};

		sendRequest('/api/documents/upd', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		});
	}

	function toggleDocumentPublic() {
		$this = $(this);

		if (confirm('Подвердить действие?') === false) {
			return false;
		}

		const postData = {
			id: $this.data('id'),
			value: $this.val()
		};

		sendRequest('/api/documents/togglePublished', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		}).then(() => {
			return location.reload();
		});
	}

	function deleteDocument() {
		$this = $(this);

		if (confirm('Подвердить действие?') === false) {
			return false;
		}

		const postData = {
			id: $this.data('id'),
		};

		sendRequest('/api/documents/del', postData).catch(error => {
			console.log(error.message);
			alert('Произошла ошибка во время выполнения запроса');
			return;
		}).then(() => {
			return location.reload();
		});
	}

	function addDocument() {
		$this = $(this);

		if (confirm('Подвердить действие?') === false) {
			return false;
		}

		const postData = {};

		sendRequest('/api/documents/add', postData).then(() => {
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