$(document).ready(() => {

	const forms = new Forms();

	$('.js-add-globalVariables--form').on('submit', function (e) {
		const $this = $(this);
		const formData = forms.getFormData(this);

		$.post('/api/globalSiteConfig/add', formData).done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})

		return false;
	})

	$('.js-upload-image').on('change', function (e) {
		const id = shopId;

		const fd = new FormData();

		fd.append('upload', this.files[0]);

		return console.log(this.files[0]);

		$.ajax({
			url: '/api/images/upload?filename=favicon.ico',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success(result) {
				console.log(result);
			}
		});

		return false;
	})
})