$(document).ready(function (e) {
	$('.js-reviews-togglePublished').on('click', reviewsTogglePublished);
	$('.js-reviews-delete').on('click', reviewsDelete);

	function reviewsDelete(e) {
		var id = $(this).data('id');

		$.post('/api/reviews/delete', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});
	}

	function reviewsTogglePublished(event) {
		var id = $(this).data('id');
		var published = '1';

		$.post('/api/reviews/togglePublished', { published: published, id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});
	}
})