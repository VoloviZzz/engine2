$(document).ready(() => {

	// загрузка главного фото товара

	$('#uploadAllFiles').on('click', function (e) {
		const files = $('#uploadable-files').get(0).files[0];
		const fd = new FormData();
		const id = $(this).data('id');

		fd.append('upload', files);

		$.ajax({
			url: '/api/goodsPosition/setMainPhoto',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success(result) {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}

				$.post('/api/goodsPosition/upd', { target: 'main_photo', value: result.data.photoId, id}).done((result) => {

					if (result.status !== 'ok') {
						console.log(result);
						return alert(result.message);
					}

					return location.reload();
				});
			}
		});
	})

	$('.js-good-edit').on('input', function (e) {
		const postData = {}

		postData.id = this.dataset.id;
		postData.target = this.dataset.target;
		postData.value = this.value.trim();

		if (!!postData.id === false || !!postData.target === false || (!!postData.value === false && postData.value !== '')) return alert('Ошибка входных параметров');

		$.post('/api/goodsPosition/upd', postData).done((result) => {

			if (result.status == 'ok') return false;

			console.log(result.error);
			alert(result.message);
		});
	})

	// установка значения параметру
	$('.js-params-values-select').on('change', function (e) {
		const postData = {
			ctrl: 'addPropsBindValue',
			good_id: $(this).data('good'),
			prop_id: $('.js-params-select').val(),
			prop_value_id: $(this).val()
		}

		$.post('/api/goodsPosition/addPropsBindValue', postData).done(result => {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message)
			}

			return location.reload();
		})
	})

	// выбор параметра для установки значения
	$('.js-params-select').on('change', function (e) {

		const selectValue = $(this).val();

		const postData = {
			ctrl: 'getParamsValues',
			id: $(this).data('id'),
			prop_id: selectValue
		};

		if (selectValue == "0") {
			$('.js-params-values-select').attr('disabled', "");
			$('.js-params-values-select').val('0');

			$('.js-params-values-select option').each((i, elem) => {
				const elemValue = elem.value;

				if (elemValue != "0") elem.remove();
			})

			return false;
		}
		else {
			$('.js-params-values-select').removeAttr('disabled');
		}

		$.post('/api/goodsPosition/getParamsValues', postData).done(result => {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			$('.js-params-values-select option').each((i, elem) => {
				const elemValue = elem.value;

				if (elemValue != "0") elem.remove();
			})

			result.body.paramsValues.map(v => {
				$('.js-params-values-select')
					.append($("<option></option>")
						.attr("value", v.id)
						.text(v.title));
			})
		})
			.catch(error => {
				alert('Что-то пошло не так')
			})
	})

	$('.js-props-values-add').on('click', function (e) {
		const title = $('#js-props-title').val().trim();
		const value = $('#js-props-value').val().trim();

		if (!!title === false || !!value === false) return alert('Оба поля должны быть заполнены');

		const postData = {
			ctrl: 'addPropsvalues',
			prop_title: title,
			prop_value: value
		};

		$.post('/api/goodsPosition/addPropsvalues', postData).done(result => {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		})
			.catch(error => {
				alert('Что-то пошло не так');
			})
	})

	$('.js-paramsBindValues-delete').on('click', function (e) {
		const postData = {
			ctrl: 'deleteParamsBindValues',
			id: $(this).data('id')
		}

		$.post('/api/goodsPosition/deleteParamsBindValues', postData).done(result => {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		})
			.catch(error => {
				alert('Что-то пошло не так');
			})
	})
})
