$(document).ready(function (e) {
	$('.feedback__form').on('submit', function (e) {
		
		var formData = $(this).serializeArray().reduce(function (prev, cur) {
			prev[cur.name] = cur.value;
			return prev;
		}, {});

		for (var key in formData) {
			if (!!formData[key] === false) {
				alert('Отсутствует поле: ' + key);
				return false;
			}
		}

		$.post('/api/feedback/add', formData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}


			alert('Сообщение отправлено');
			return location.reload();
		})

		return false;
	})
})