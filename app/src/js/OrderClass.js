function Order() { };

Order.prototype.checkFilledForm = function (e) {
	const orderData = {};

	let allInputFilled = true;

	$('.js-order-data').each((i, elem) => {
		$elem = $(elem);

		const dataRequired = $elem.hasClass('required');
		const dataValue = $elem.val();

		if (dataRequired === true && dataValue.length == 0) {
			allInputFilled = false;
		}
	})

	if (allInputFilled === true) {
		$('.js-go-next-step').removeAttr('disabled');
	}
	else {
		$('.js-go-next-step').attr('disabled', 'disabled');
	}
}