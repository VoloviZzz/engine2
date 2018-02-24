'use strict';

$(document).ready(function () {
	var forms = new Forms();

	$('.js-add-component-form').on('submit', function (e) {
		var formData = forms.getFormData(this);
		return false;
	});
});