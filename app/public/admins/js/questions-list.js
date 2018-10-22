$(document).ready(function () {

	var selectCategory = $('.js-change-category');

	selectCategory.on('change', function () {

		var value = $(this).val();
		var id = $(this).data('id');

		$.post('/api/questions/changeCategory', { value: value, id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

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

		if (confirm('Удалить?') === false) return false;

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

			if (!!postData.fragment_id === false) {
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

	$('.js-questionCategories-add').on('submit', function (e) {
		e.preventDefault();

		var data = {
			title: this.elements.category.value.trim(),
			target_id: this.elements.target_id.value

		};

		$.post("/api/questions/addCategory", data).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});

		return false;
	})

	$('.js-questionCategories-delete').on('click', function (e) {
		var data = {
			id: $(this).data('id')
		};

		var title = $(this).data('title');

		if (confirm('Удалить категорию: ' + title + '?') === false) return false;

		$.post("/api/questions/deleteCategory", data).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});
	})
})