$(document).ready(() => {


	$('.js-change-order-status').on('click', changeOrderStatus)

	function changeOrderStatus(e) {

		const hash = $(this).data('hash')
		const status = $(this).val();

		$.post('/api/order/changeStatus', { hash, status: `${status}` }).done((result) => {
			if(result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			location.reload();
		})
	}
}) 