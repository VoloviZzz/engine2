$(document).ready(function (e) {
	$('.js-reviews-togglePublished').on('click', reviewsTogglePublished);

	function reviewsTogglePublished(event) {
		const id = $(this).data('id');
		const published = '1';

		$.post('/api/reviews/togglePublished', { published: published, id: id }).done(function (result) {
			if(result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});
	}
})