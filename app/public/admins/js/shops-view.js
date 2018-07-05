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

		for (var i = 0; i < this.files.length; i++) {
			var file = this.files[i];
			fd.append('upload-' + i, file);
		}

		var uploadParams = $.param({
			target_id: id,
			target: 'shop'
		});

		$('#js-photos-load-message').show();
		$(this).attr('disabled', 'disabled');

		$.ajax({
			url: '/api/images/multipleUpload?' + uploadParams,
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {

				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}

				// [0] - берётся первая загруженная фотография,
				// [1] - берётся id вставленного фото
				var value = result.resultAddPhoto[0][1];

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