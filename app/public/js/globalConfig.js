$(document).ready(() => {
	
	const forms = new Forms();

	$('.js-add-globalVariables--form').on('submit', function(e) {
		const $this = $(this);
		const formData = forms.getFormData(this);
		
		$.post('/api/globalSiteConfig/add', formData).done((result) => {
			if(result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})

		return false;
	})
})