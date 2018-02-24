$(document).ready(e => {
	$('.js-clear-cart').on('click', function (e) {
		$.post('/api/shoppingCart/clearCart').done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	$('.js-item-remove').on('click', function (e) {
		const position_id = $(this).data('id');

		$.post('/api/shoppingCart/removeFromCart', { position_id }).done(result => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	})

	function handleEditCount({ currentTarget }) {
		const $this = $(currentTarget);
		const vector = $this.data('vector');
		const good_id = $this.data('goodId');

		if(!!vector === false || !!good_id === false) {
			console.log('Отсутствуют параметры для изменения количества', vector, good_id);
			return false;
		}

		return editCount({good_id, vector});
	}

	function editCount({good_id, vector}) {
		$.post('/api/shoppingCart/editCount', {good_id, vector}).done((data) => {
			if(data.status !== 'ok') {
				console.log(data);
				return alert(data.message);
			}

			location.reload();
		})
	}

	$('.js-goods-count-edit').on('click', handleEditCount);
})