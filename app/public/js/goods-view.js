$(document).ready(() => {

	baguetteBox.run('.baguetteBox');

	$('.js-photos-slider').flexslider({
		animation: "slide"
	});

	const addToCartBtn = document.querySelector(".good-price__buy");

	addToCartBtn.addEventListener('animationend', function () {
		addToCartBtn.removeAttribute("disabled")
		addToCartBtn.classList.remove("added");
	})

	$('#js-goodsView-add-to-cart').on('click', function (e) {
		const position_id = $(this).data('id');

		if (addToCartBtn.classList.contains('added')) {
			return false;
		}

		$.post('/api/shoppingCart/addToCart', { position_id }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			$('#js-shoppingCart-goodsCount').text(result.data.cart.totalCountGoods);
			addToCartBtn.setAttribute("disabled", "disabled");
			addToCartBtn.classList.add("added");
		})
	})
})
