$(document).ready(() => {
	const forms = new Forms();
	
	$('.js-add-component-form').on('submit', function(e) {
		const formData = forms.getFormData(this);
		return false;
	})
})