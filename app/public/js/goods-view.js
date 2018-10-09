'use strict';

$(document).ready(function () {

	baguetteBox.run('.baguetteBox');

	$('.js-photos-slider').flexslider({
		animation: "slide"
	});

	var $addToCartBtn = $(".good-price__buy");

	$addToCartBtn.on('animationend', function () {
		addToCartBtn.removeAttribute("disabled");
		addToCartBtn.classList.remove("added");
	});

	$('#js-goodsView-add-to-cart').on('click', function (e) {
		var position_id = $(this).data('id');

		if (addToCartBtn.classList.contains('added')) {
			return false;
		}

		$.post('/api/shoppingCart/addToCart', { position_id: position_id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			var $countBadge = $('#js-shoppingCart-goodsCount');

			if(result.data.cart.totalCountGoods > 0) {
				$countBadge.show();
			}

			$('#js-shoppingCart-goodsCount').text(result.data.cart.totalCountGoods);
			addToCartBtn.setAttribute("disabled", "disabled");
			addToCartBtn.classList.add("added");
			setTimeout(function () {
				addToCartBtn.removeAttribute("disabled");
			}, 2600);
		});
	});
});