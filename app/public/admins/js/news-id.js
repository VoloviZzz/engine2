$(document).ready(function () {
	$('.js-news-update').on('change', function (e, CKvalue) {
		var $this = $(this);
		var target = $this.data('target');
		var id = $this.data('id');

		var value = $this.val().trim();

		if (typeof CKvalue !== 'undefined') {
			value = CKvalue;
		}

		$.post('/api/news/upd', { target: target, id: id, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-news-togglePublication').on('click', function (e) {
		var id = $(this).data('id');
		var value = $(this).data('value');
		var target = 'public';

		$.post('/api/news/publicate', { target: target, id: id, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	$('.js-news-upload-mainphoto').on('change', function (e) {

		var fd = new FormData();
		var id = $(this).data('id');

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/images/upload?filename=' + this.files[0].name,
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				var value = result.data.fileUrl;
				var target = 'main_photo';

				$.post('/api/news/upd', { target: target, id: id, value: value }).done(function (result) {
					if (result.status !== 'ok') {
						console.log(result);
						return alert(result.message);
					}

					return location.reload();
				})
			}
		});
		return false;
	});
})