$(document).ready(function () {
	$('.js-change-fragment-target').on('change', changeFragmentTarget);
	$('.js-add-post-target').on('click', addPostTarget);
	$('.js-posts-add').on('click', addPosts);
	$('.js-post-delete').on('click', postDelete);
	$('.js-post-togglePublication').on('click', postTogglePublication);
	$('.js-post-upload-mainphoto').on('change', postUploadMainphoto);
	$('.js-post-update').on('change', postUpdate);
	$('.js-fragment-set-url').on('click', fragmentSetUrl);

	function fragmentSetUrl(e) {
		var value = $('.js-fragment-url-input').val().trim();
		var fragmentId = $('.js-fragment-url-input').data('fragmentId');

		var postData = {};

		postData.target = 'url';
		postData.value = value;
		postData.fragment_id = fragmentId;

		const urlValid = /^\/[a-z-]+$/.test(value);

		if (urlValid === false) {
			return alert(`Неправильный формат url`);
		}

		$.post('/api/fragments/updSettings', postData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		});
	}

	function addPosts(e) {
		var $button = $(this);
		var target = $button.data('target');
		var postData = {};
		
		$button.attr('disabled', 'disabled');

		postData.target = target;

		$.post('/api/posts/addItem', postData).done(function (result) {

			$button.removeAttr('disabled');

			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	}

	function postDelete(e) {
		var $button = $(this);
		var id = $button.data('id');
		$button.attr('disabled', 'disabled');

		$.post('/api/posts/deleteItem', { id: id }).done(function (result) {

			$button.removeAttr('disabled');

			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	}

	function postTogglePublication(e) {
		var id = $(this).data('id');
		var value = $(this).data('value');
		var target = 'public';

		$.post('/api/posts/publicate', { target: target, id: id, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	}

	function postUploadMainphoto(e) {
		var fd = new FormData();
		var id = $(this).data('id');

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/images/upload?filename=' + this.files[0].name,
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				var value = result.data.fileUrl;
				var target = 'main_photo';

				$.post('/api/posts/upd', { target: target, id: id, value: value }).done(function (result) {
					if (result.status !== 'ok') {
						console.log(result);
						return alert(result.message);
					}

					return location.reload();
				})
			}
		});
		return false;
	}

	function postUpdate(e, CKvalue) {
		var $this = $(this);
		var target = $this.data('target');
		var id = $this.data('id');

		var value = $this.val().trim();

		if (typeof CKvalue !== 'undefined') {
			value = CKvalue;
		}

		$.post('/api/posts/upd', { target: target, id: id, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	}

	function changeFragmentTarget() {
		var value = $(this).val();
		var fragmentId = $(this).data('fragmentId');

		var postData = {};

		postData.target = 'target';
		postData.value = value;
		postData.fragment_id = fragmentId;

		$.post('/api/fragments/updSettings', postData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		});
	}

	function addPostTarget(e) {
		var value = $('.js-post-target-input').val().trim();

		var postData = {};

		postData.value = value;

		$.post('/api/posts/addPostTarget', postData).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		});
	}
})