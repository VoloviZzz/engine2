
$(document).ready(() => {
	$('.flexslider').flexslider({
		animation: 'slide'
	})

	$('.add-visited').on('click', function(e) {

		var postData = {
			ctrl: 'add_visited'
		}

		$.post('', postData).done(result => {
			if(result.status == 'ok') {
				return location.reload();
			}

			return alert(result.data);
		})
	})

	baguetteBox.run('.baguetteBoxOne', {
		animation: false,
		onChange(currentIndex, imagesCount) {
			var bagImage = $('#baguetteBox-figure-0 img');
			var imageSrc = bagImage.attr('src');
			var defImage = $(`.baguetteBoxOne img[src="${imageSrc}"]`);
			
			if(defImage.hasClass('img90')) {
				bagImage.addClass('img90')
			}
		}
	});

	$('.js-delete-btn').on('click', function(e) {
		var $this = $(this);
		var postData = {
			ctrl: 'delete-memory-item',
			id: $this.data('id'),
			target: $this.data('target')
		}

		$.post("", postData)
			.done(result => {
				if(result.status == 'ok') {
					return location.reload();
				}

				alert(result.message);
			})
    })

	$('.del-visited').on('click', function(e) {

		var postData = {
			ctrl: 'del_visited'
		}

		$.post('', postData).done(result => {
			if(result.status == 'ok') {
				return location.reload();
			}

			return alert(result.data);
		})
	});

	$('.js-add-necrologue').on('click', () => {
		$('.js-form-add-necrologue').toggle();
	})

	$('.js-send-necrologue').on('click', function (e) {
		var postData = {
			ctrl: 'add_necrologue',
			value: $('.js-necrologue-text').val().trim(),
			id: $(this).data('id')
		};

		if(postData.value == '') {
			return alert('Некролог не может быть пустым');
		}

		if(postData.value.length < 10) {
			return alert('Некролог не может быть коротким');
		}

		$.post('', postData).done(result => {
			if(result.status == 'ok') {
				return location.reload();
			}

			console.error(result);
		})
		.catch(error => {
			console.error(error);
			console.error(error.message);
		})
	})

	$('.js-send-biography').on('click', function (e) {
		var postData = {
			ctrl: 'add_biography',
			value: $('.js-biography-text').val().trim(),
			id: $(this).data('id')
		};

		if(postData.value == '') {
			return alert('Биография не может быть пустой');
		}

		if(postData.value.length < 10) {
			return alert('Биография не может быть короткой');
		}

		$.post('', postData).done(result => {
			if(result.status == 'ok') {
				return location.reload();
			}

			console.error(result);
		})
		.catch(error => {
			console.error(error);
			console.error(error.message);
		})
	})

	$('.js-select-photos').on('click', function(e) {
		$('.js-upload-file').click();
	})

	$('.js-add-biographie').on('click', () => {
		$('.js-form-add-biography').toggle();
	})
})