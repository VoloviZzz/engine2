'use strict';

$(document).ready(function () {

	$('.save-added-component').click(function () {
		var query = {
			title: $('.add-title').val(),
			 component: $('.add-component').val(),
			 block_id: $(".block_id option:selected").val(),
			 static: $(".static:checked").val(),
			 once: $(".once:checked").val()
		 };
		$.post('/api/components/addComponent', query)
		.done(function (result) {
			if (result.status == 'ok') {
				console.log(result);
				location.reload();
			}
		});
	});

});
