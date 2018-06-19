$(document).ready(function (e) {

	$('.js-achievements-upload-img').on('change', function (e) {
		var id = $(this).data('id');

		var fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/images/upload',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				var fileUrl = result.data.fileUrl;
				$.post('/api/achievements/update', { target: 'img', value: fileUrl, id }).done(function (result) {
					if (result.status !== 'ok') {
						console.log(result);
						return alert(result.message);
					}

					location.reload();
				})
			}
		});
	})

	$('.js-achievements-update').on('input', function (e) {
		var postData = {};
		var $this = $(this);

		postData.target = $this.data('target');
		postData.value = $this.val().trim();
		postData.id = $this.data('id');

		if(!!postData.target === false) return alert('Отсутствует target')
		if(!!postData.value === false && postData.value !== '') return alert('Отсутствует value');
		if(!!postData.id === false) return alert('Отсутствует id')

		$.post('/api/achievements/update', postData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-achievements-add').on('click', function (e) {

		$.post('/api/achievements/add', {}).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	$('.js-achievements-delete').on('click', function (e) {

		var postData = {};
		var $this = $(this);

		postData.id = $this.data('id');

		if(!confirm('Удалить достижение?')) return false;

		$.post('/api/achievements/delete', postData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})
})