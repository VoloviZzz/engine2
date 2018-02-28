$(document).ready(function (e) {
	$('.js-reviews-togglePublished').on('click', reviewsTogglePublished);

	function reviewsTogglePublished(event) {
		const id = $(this).data('id');
		const published = '1';
		
		App.sendPost('/api/reviews/togglePublished', { id, value: published }).then(function(data) {
			
		})
	}
})