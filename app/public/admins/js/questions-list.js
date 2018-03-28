$(document).ready(function () {
	$('.js-question-updateAnswer').on('input', function () {
		var value = $(this).val().trim();
		var id = $(this).data('id');

		$.post('/api/questions/editAnswer', { value: value, id: id }).done(function (result) {
			if(result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})
	
	$('.js-question-togglePusblished').on('click', function () {
		var id = $(this).data('id');
		var value = $(this).data('value');

		$.post('/api/questions/togglePublication', { value: value, id: id }).done(function (result) {
			if(result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})
})