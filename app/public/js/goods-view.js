$(document).ready(() => {

	baguetteBox.run('.baguetteBox');

	$('.js-photos-slider').flexslider({
		animation: "slide"
	});

	$('#js-goodsView-add-to-cart').on('click', function (e) {
		const position_id = $(this).data('id');

		$.post('/api/shoppingCart/addToCart', { position_id }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			$('#js-shoppingCart-goodsCount').text(result.data.cart.totalCountGoods);
		})
	})
})
