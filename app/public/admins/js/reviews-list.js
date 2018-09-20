$(document).ready(function (e) {
	$('.js-reviews-togglePublished').on('click', reviewsTogglePublished);
	$('.js-reviews-delete').on('click', reviewsDelete);

	$('#js-add-reviews-category').on('submit', function (e) {

		var title = this.elements.title.value.trim();

		$.post('/api/reviews/addCategory', { title: title }).done(function (result) {
			if(result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		});

		return false;
	});

	function reviewsDelete(e) {
		var id = $(this).data('id');

		if (confirm('Удалить?') === false) return false;

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