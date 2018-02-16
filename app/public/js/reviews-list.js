$(document).ready(() => {
	// reviewsListSetHeight();

	const Reviews = {
		add() {

			let reviewText = Reviews.getText();

			if (!reviewText) return alert('Нельзя добавить пустой отзыв');
			if (reviewText.length < 6) return alert('Длина отзыва должна быть не меньше 6 символов');

			$.post("/api/reviews/add", { text: reviewText }).done(result => {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}

				location.reload();
			})
		},

		getText() {
			return $('#add-review-text').val().trim();
		}
	}

	$('#add-review-text').on('keydown', (e) => {
		const ENTER_KEY = 13;
		e = e || window.event;
		if (e.keyCode === ENTER_KEY) return Reviews.add();
	})

	$('.new-reviews-button').on('click', Reviews.add);
})

function reviewsListSetHeight() {
	let pageTextHeight = $('.reviews-page-text').outerHeight(true);
	let contentHeight = $('.section-content').outerHeight(true);
	let addWrapperHeight = $('.reviews-add-wrapper').outerHeight(true);

	let reviewsListHeight = contentHeight - (addWrapperHeight + pageTextHeight) + 'px';

	$('.reviews-list-wrapp').css({ height: reviewsListHeight });
}