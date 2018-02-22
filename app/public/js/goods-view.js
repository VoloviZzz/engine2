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

var addToCartBtn = document.querySelector(".good-price__buy");

	addToCartBtn.addEventListener("click", function(event) {
		event.preventDefault();
		if (addToCartBtn.classList.contains('added')) {
			addToCartBtn.classList.remove("added");
			addToCartBtn.setAttribute("disabled", "disabled");
			getComputedStyle(addToCartBtn).width;
			addToCartBtn.classList.add("added");
			setTimeout(function() {
				addToCartBtn.removeAttribute("disabled")
			}, 2600);
		} else {
			addToCartBtn.setAttribute("disabled", "disabled");
			addToCartBtn.classList.add("added");
			setTimeout(function() {
				addToCartBtn.removeAttribute("disabled")
			}, 2600);
		}
	});
