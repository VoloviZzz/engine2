'use strict';

$(document).ready(function () {

	var forms = new Forms();

	$('.js-add-globalVariables--form').on('submit', function (e) {
		var $this = $(this);
		var formData = forms.getFormData(this);

		$.post('/api/globalSiteConfig/add', formData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});

		return false;
	});

	$('.js-upload-image').on('change', function (e) {
		var id = shopId;

		var fd = new FormData();

		fd.append('upload', this.files[0]);

		return console.log(this.files[0]);

		$.ajax({
			url: '/api/images/upload?filename=favicon.ico',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				console.log(result);
			}
		});

		return false;
	});
});