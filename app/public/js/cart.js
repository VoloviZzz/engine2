$(document).ready(e => {
	$('.js-clear-cart').on('click', function (e) {
		$.post('/api/shoppingCart/clearCart').done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	$('.js-item-remove').on('click', function (e) {
		const position_id = $(this).data('id');

		$.post('/api/shoppingCart/removeFromCart', { position_id }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})
})