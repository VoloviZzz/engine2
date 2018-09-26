$(document).ready(function (e) {
	$('#toggle-admin-mode').on('click', toggleAdmin);

	$(document).on('keydown', function (e) {
		if (e.shiftKey && e.ctrlKey && e.keyCode == 'E'.charCodeAt(0)) {
			toggleAdmin();
		}
	});

	$('#js-adminPanel-showRouteSettings').click(function (e) {
		const $modal = $('#js-adminPanel-routeSettingsModal');
		const $close = $modal.find('.close');

		const closeModal = function () {
			$modal.hide(function(e) {
				$close.off('click', closeModal);
			});
		};

		$modal.show();


		$close.on('click', closeModal);
		
		$(window).click(function(e) {
			if(e.target === $modal.get(0)) {
				closeModal();
			}
		})
	});


	function toggleAdmin() {
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
	}
})