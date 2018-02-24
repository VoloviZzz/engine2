$(document).ready(() => {
	$('.js-goodsPosition-delete').on('click', function (e) {
		const id = $(this).data('id');

		if (!confirm('Удалить товар с сайта?')) return false;

		$.post('/api/goodsPosition/delete', { id }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})
})