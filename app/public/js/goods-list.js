$(document).ready(function (e) {
	$('#js-shop-search-form').submit(function (e) {
		var forms = new Forms();
		var formData = forms.getFormData(this);

		$.post('/api/goodsList/search', { value: formData.searchQuery }).done(function(result) {
			$('#js-load-content').html(result.data);
		})

		return false;
	})
})