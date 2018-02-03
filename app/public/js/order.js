$(document).ready(() => {
    $('.js-go-next-step').on('click', goNextStep);
    $('.js-order-data').on('change', checkFilledForm)
    
	$("input[name=phone]").mask("+7(999)-999-99-99");

    function checkFilledForm(e) {
        const orderData = {};

        let allInputFilled = true;

        $('.js-order-data').each((i, elem) => {
            $elem = $(elem);

            const dataRequired = $elem.hasClass('required');
            const dataValue = $elem.val();

            if(dataRequired === true && dataValue.length == 0) {
                allInputFilled = false;
            }
        })

        if(allInputFilled === true) {
            $('.js-go-next-step').removeClass('order-disabled');
        }
        else {
            $('.js-go-next-step').addClass('order-disabled');
        }
    }
    
    function goNextStep(e) {
        
		const orderData = getOrderData();

        if(orderData === false || $(this).hasClass('order-disabled')) return alert('Заполнены не все обязательные поля');
		
        return $.post('/api/order/setDeliveryData', orderData).done(result => {
            if(result.status !== 'ok') {
                console.log(result);
				return alert(result.message);
            }
            
            $('[data-target=delivery]').show();
        })
    }

    function getOrderData() {

        const errors = [];
        const orderData = {};

        $('.js-order-data').each((i, elem) => {
            $elem = $(elem);
            
            const dataRequired = $elem.hasClass('required');
            const dataValue = $elem.val();
            const dataName = $elem.prop('name');

            if(dataRequired === true && dataValue.length == 0) {
                errors.push($elem);
            }
            else if(dataValue.length > 0) {
                orderData[dataName] = dataValue;
            }
        })

        if(errors.length > 0) {
            return false;
        }

        return orderData;
    }
})