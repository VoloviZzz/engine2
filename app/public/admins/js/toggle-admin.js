$(document).ready(function (e) {
	$('#toggle-admin-mode').on('click', function (e) {
		var postData = {
			ctrl: 'toggle_admin_mode'
		};

		$.post("/toggle-admin", postData).done(function (result) {
			if (result.status == 'ok') {
				return location.reload();
			}
			else {
				console.log(result);
			}
		})
	})
})