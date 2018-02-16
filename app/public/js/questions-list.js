$(document).ready(e => {
	$('.show-question-button').on('click', function (e) {
		$(this).parent().toggleClass('show-question');
	})

	$('.question').on('click', (e) => {
		e.preventDefault();
	})

	$('.add-question-button').on('click', () => {
		let data = {
			ctrl: "add question",
			question: $('.add-question-text').val().trim()
		};

		$.post("/api/questions/addQuestion", data).done(result => {
			if (result.status !== 'ok') return alert(`Ошибка выполнения: ` + result);

			return location.reload();
		})
	})
})