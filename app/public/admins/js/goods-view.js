'use strict';

$(document).ready(function () {

	$('.js-goodsPosition-delete').on('click', function (e) {
		var id = $(this).data('id');

		if (!confirm('Удалить товар с сайта?')) return false;

		$.post('/api/goodsPosition/delete', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.href = '/shop';
		});
	});

	$('.js-goodsPhoto-delete').on('click', function (e) {
		var id = $(this).data('id');

		$.post('/api/photos/delete', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});
	});

	$('#uploadable-files').on('change', function (e) {
		var $input = $(this);
		var files = $input.get(0).files[0];
		var fd = new FormData();
		var id = $input.data('id');

		fd.append('upload', files);

		$input.attr('disabled', 'disabled');

		$.ajax({
			url: '/api/goodsPosition/addPhoto?goodId=' + id,
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				$input.removeAttr('disabled');

				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}

				location.reload();
			}
		});
	});

	$('.js-good-edit').on('input', function (e) {
		var postData = {};

		postData.id = this.dataset.id;
		postData.target = this.dataset.target;
		postData.value = this.value.trim();

		if (!!postData.id === false || !!postData.target === false || !!postData.value === false && postData.value !== '') return alert('Ошибка входных параметров');

		$.post('/api/goodsPosition/upd', postData).done(function (result) {

			if (result.status == 'ok') return false;

			console.log(result.error);
			alert(result.message);
		});
	});

	// установка значения параметру
	$('.js-params-values-select').on('change', function (e) {
		var postData = {
			ctrl: 'addPropsBindValue',
			good_id: $(this).data('good'),
			prop_id: $('.js-params-select').val(),
			prop_value_id: $(this).val()
		};

		$.post('/api/goodsPosition/addPropsBindValue', postData).done(function (result) {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		});
	});

	// выбор параметра для установки значения
	$('.js-params-select').on('change', function (e) {

		var selectValue = $(this).val();

		var postData = {
			ctrl: 'getParamsValues',
			id: $(this).data('id'),
			prop_id: selectValue
		};

		if (selectValue == "0") {
			$('.js-params-values-select').attr('disabled', "");
			$('.js-params-values-select').val('0');

			$('.js-params-values-select option').each(function (i, elem) {
				var elemValue = elem.value;

				if (elemValue != "0") elem.remove();
			});

			return false;
		} else {
			$('.js-params-values-select').removeAttr('disabled');
		}

		$.post('/api/goodsPosition/getParamsValues', postData).done(function (result) {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			$('.js-params-values-select option').each(function (i, elem) {
				var elemValue = elem.value;

				if (elemValue != "0") elem.remove();
			});

			result.body.paramsValues.map(function (v) {
				$('.js-params-values-select').append($("<option></option>").attr("value", v.id).text(v.title));
			});
		}).catch(function (error) {
			alert('Что-то пошло не так');
		});
	});

	$('.js-props-values-add').on('click', function (e) {
		var title = $('#js-props-title').val().trim();
		var value = $('#js-props-value').val().trim();

		if (!!title === false || !!value === false) return alert('Оба поля должны быть заполнены');

		var postData = {
			ctrl: 'addPropsvalues',
			prop_title: title,
			prop_value: value
		};

		$.post('/api/goodsPosition/addPropsvalues', postData).done(function (result) {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		}).catch(function (error) {
			alert('Что-то пошло не так');
		});
	});

	$('.js-paramsBindValues-delete').on('click', function (e) {
		var postData = {
			ctrl: 'deleteParamsBindValues',
			id: $(this).data('id')
		};

		$.post('/api/goodsPosition/deleteParamsBindValues', postData).done(function (result) {
			if (result.status == 'bad') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		}).catch(function (error) {
			alert('Что-то пошло не так');
		});
	});
});