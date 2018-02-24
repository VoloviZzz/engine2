'use strict';

$(document).ready(function () {

	var shopId = $('#js-shop-id').val();

	$('.js-shopSchedule-edit').on('input', function (e) {
		var value = $(this).text().trim();
		var scheduleDay = $(this).data('scheduleDay');
		var target = $(this).data('target');

		if (value.split(':').length != "2") {
			return false;
		}

		if (isNaN(Number(value.split(':')[0]))) {
			return false;
		}

		if (isNaN(Number(value.split(':')[1]))) {
			return false;
		}

		console.log(value);

		$.post('/api/shopsList/updSchedule', { shopId: shopId, value: value, scheduleDay: scheduleDay, target: target }).done(function (result) {
			console.log(result);
		});
	});

	$('.js-shopTitle-update').on('input', function (e) {
		var value = $(this).val();

		$.post('/api/shopsList/update', { value: value, id: shopId, target: 'title' }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		});
	});

	$('.js-shopText-update').on('change', function (e, data) {
		var value = data.trim();

		$.post('/api/shopsList/update', { value: value, id: shopId, target: 'text' }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		});
	});

	$('.js-shopPhone-update').on('input', function (e) {
		var value = $(this).val().trim();

		$.post('/api/shopsList/update', { value: value, id: shopId, target: 'phones' }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		});
	});

	$('.js-shopAddress-update').on('input', function (e) {
		var value = $(this).val().trim();

		$.post('/api/shopsList/update', { value: value, id: shopId, target: 'address' }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		});
	});

	$('.js-shopCoords-update').on('input', function (e) {
		var value = $(this).val().trim();

		$.post('/api/shopsList/update', { value: value, id: shopId, target: 'coords' }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		});
	});

	$('.js-shopPhoto-add').on('change', function (e) {
		var id = shopId;

		var fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/images/upload',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}
				var value = result.data.fileUrl;
				return $.post('/api/shopsList/update', { id: id, target: 'main_photo', value: value }).done(function (result) {
					if (result.status !== 'ok') {
						console.log(result);
						return alert(result.message);
					}

					location.reload();
				});
			}
		});

		return false;
	});
});