'use strict';

$(document).ready(function () {
	$('.js-goodsPosition-delete').on('click', function (e) {
		var id = $(this).data('id');

		if (!confirm('Удалить товар с сайта?')) return false;

		$.post('/api/goodsPosition/delete', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});
	});
});