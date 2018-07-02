$(document).ready(function () {
	$('.js-question-updateAnswer').on('input', function () {
		var value = $(this).val().trim();
		var id = $(this).data('id');

		$.post('/api/questions/editAnswer', { value: value, id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-question-togglePusblished').on('click', function () {
		var id = $(this).data('id');
		var value = $(this).data('value');

		$.post('/api/questions/togglePublication', { value: value, id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	$('.js-question-delete').on('click', function () {
		var id = $(this).data('id');

		$.post('/api/questions/delQuestion', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		})
	})

	$('#js-add-question-target').on('submit', function (e) {

		var forms = new Forms();
		var $form = $(this);
		var formData = forms.getFormData($form);

		var postData = {};

		postData.title = formData.title;

		$.post('/api/questions/createTarget', postData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			var postData = {};

			postData.target = 'target';
			postData.value = result.targetId;
			postData.fragment_id = $form.data('fragment-id');

			if(!!postData.fragment_id === false) {
				alert('Что-то пошло не так. Обновите страницу и проверьте список категорий');
				return false;
			}

			$.post('/api/fragments/updSettings', postData).done(function (result) {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}

				location.reload();
			})
		});

		return false;
	});
})