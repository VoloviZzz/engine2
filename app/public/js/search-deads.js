$(document).ready(() => {

	const State = {
		searchMode: 'default'
	}

	$('.how-search').on('click', function (e) {
		$('#how-seach__info').toggle();
	})

	$('.js-advanced-search-item').on('keydown', function (e) {
		let keyCode = e.keyCode;
		let isEnter = keyCode == 13;

		if (isEnter) {
			let value = this.value.trim();

			let validValue = value.replace(/\s+/g, " ")

			this.value = validValue;
			return findGraves();
		}
	})

	$('#search-fio').on('keydown', function (e) {
		let keyCode = e.keyCode;
		let isEnter = keyCode == 13;

		if (isEnter) {
			let value = this.value.trim();

			let validValue = value.replace(/\s+/g, " ")

			this.value = validValue;
			return findGraves();
		}
	})

	$('#find-graves').on('click', findGraves)

	$('#show-advanced').on('click', function (e) {

		State.searchMode = State.searchMode == 'advanced' ? 'default' : 'advanced';

		if (State.searchMode == 'advanced') {
			$('#search-fio').attr('disabled', 'true');
		}
		else {
			$('#search-fio').removeAttr('disabled');
		}

		$('.advanced_search').toggleClass('advanced_search__showed');
	})

	function findGraves() {
		let str = $('#search-fio').val().trim();
		let search_mode = State.searchMode;

		let postData = {
			surname: $('#search-f').val().trim() || '',
			firstname: $('#search-i').val().trim() || '',
			patronymic: $('#search-o').val().trim() || '',
			placeId: $('#search-p').val().trim() || '',
			id: $('#search-g').val().trim() || '',
			fullname: $('#search-fio').val().trim() || '',
			search_mode
		};

		$('#search-list').html(`<img id="search-loader" src="http://mpkpru.ru/common/img/load.gif" style="
			margin: 20px auto;
			display: block;">
		`);

		$.post("/api/search-deads/search", postData).done(res => {
			$('#search-list').html(res.data);
		}).catch(e => {
			console.log(e.responseText);
		});
	}
})