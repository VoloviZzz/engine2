$(document).ready(function () {
	$('.js-news-update').on('change', function (e, value) {
		var $this = $(this);
		var target = $this.data('target');
		var id = $this.data('id');
		var value = value || $this.val().trim();

		$.post('/api/news/upd', { target: target, id: id, value: value }).done(function(result) {
			if(result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
		})
	})
})