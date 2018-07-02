'use strict';

$(document).ready(function (e) {
	$('.show-question-button').on('click', function (e) {
		$(this).parent().toggleClass('show-question');
	});

	$('.question').on('click', function (e) {
		e.preventDefault();
	});

	$('.add-question-button').on('click', function () {
		var data = {
			ctrl: "add question",
			question: $('.add-question-text').val().trim(),
			target: $('#js-question-target').val()
		};

		$.post("/api/questions/addQuestion", data).done(function (result) {
			if (result.status !== 'ok') return alert('\u041E\u0448\u0438\u0431\u043A\u0430 \u0432\u044B\u043F\u043E\u043B\u043D\u0435\u043D\u0438\u044F: ' + result);

			return location.reload();
		});
	});
});