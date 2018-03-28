$(document).ready(function (e) {
	$('.js-news-add').on('click', function (e) {

		var $button = $(this);
		$button.attr('disabled', 'disabled');

		$.post('/api/news/addItem').done(function (result) {

			$button.removeAttr('disabled');

			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	$('.js-news-delete').on('click', function (e) {

		var $button = $(this);
		var id = $button.data('id');
		$button.attr('disabled', 'disabled');

		$.post('/api/news/deleteItem', { id: id }).done(function (result) {

			$button.removeAttr('disabled');

			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})
})