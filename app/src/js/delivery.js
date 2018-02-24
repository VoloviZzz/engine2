$(document).ready(() => {
    $('.input-tabs').on('change', setDelivery);
    $('.js-delivery-data').on('input', checkFilledForm);
    $('.js-delivery-next-step').on('click', goNextStep);
    
    
    let deliveryValue = $('.input-tabs:checked').data('value');
    
    checkNextStep(deliveryValue);

    function goNextStep(e) {
        
        const $elem = $(this);
        
        const postData = {
            ctrl: 'setDeliveryData',
            value: deliveryValue,
            data: {}
        };

        $('.js-delivery-data').each((i, e) => {
            let $e = $(e);
            
            const dataRequired = $e.hasClass('required');
            const dataValue = $e.val();
            const dataName = $e.prop('name');
            
            if(dataValue.length > 0) {
                postData.data[dataName] = dataValue;
            }
        })

        postData.data = JSON.stringify(postData.data);
        
        $.post('', postData).done((result) => {
            console.log(result);
            if(result.status == 'bad') {
                return alert(result.message);
            }
            
            location.href = $(this).data('href');
        })
    }
    
    function checkNextStep(value) {
        if(value == 2) {
            checkFilledForm();
        }
        else {
            $('.js-delivery-next-step').removeAttr('disabled');
        }

        deliveryValue = value;
    }
    
    function checkFilledForm() {
        const deliveryData = {};
        
        let allInputFilled = true;
        
        $('.js-delivery-data').each((i, elem) => {
            $elem = $(elem);
            
            const dataRequired = $elem.hasClass('required');
            const dataValue = $elem.val();
            
            if(dataRequired === true && dataValue.length == 0) {
                allInputFilled = false;
            }
        })
        
        if(allInputFilled === true) {
            $('.js-delivery-next-step').removeAttr('disabled');
        }
        else {
            $('.js-delivery-next-step').attr('disabled', 'disabled');
        }
    }
    
    function setDelivery() {
        const $elem = $(this);
        const postData = {
            ctrl: 'setDelivery',
            value: $elem.data('value')
        };
        
        checkNextStep(postData.value);
        
        $.post('', postData).done((result) => {
            console.log(result);
            if(result.status == 'bad') {
                return alert(result.message);
            }
        })
    }
})