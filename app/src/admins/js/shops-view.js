$(document).ready(() => {

	const shopId = $('#js-shop-id').val();

	$('.js-shopSchedule-edit').on('input', function (e) {
		const value = $(this).text().trim();
		const scheduleDay = $(this).data('scheduleDay');
		const target = $(this).data('target');

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

		$.post('/api/shopsList/updSchedule', { shopId, value, scheduleDay, target }).done(result => {
			console.log(result);
		})
	})

	$('.js-shopTitle-update').on('input', function (e) {
		const value = $(this).val();

		$.post('/api/shopsList/update', { value, id: shopId, target: 'title' }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-shopText-update').on('change', function (e, data) {
		const value = data.trim();

		$.post('/api/shopsList/update', { value, id: shopId, target: 'text' }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-shopPhone-update').on('input', function (e) {
		const value = $(this).val().trim();

		$.post('/api/shopsList/update', { value, id: shopId, target: 'phones' }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-shopAddress-update').on('input', function (e) {
		const value = $(this).val().trim();

		$.post('/api/shopsList/update', { value, id: shopId, target: 'address' }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})
	
	$('.js-shopCoords-update').on('input', function (e) {
		const value = $(this).val().trim();

		$.post('/api/shopsList/update', { value, id: shopId, target: 'coords' }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-shopPhoto-add').on('change', function (e) {
		const id = shopId;

		const fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/images/upload',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success(result) {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}
				const value = result.data.fileUrl;
				return $.post('/api/shopsList/update', {id, target: 'main_photo', value}).done(result => {
					if(result.status !== 'ok') {
						console.log(result);
						return alert(result.message);
					}

					location.reload();
				})
			}
		});

		return false;
	})
})