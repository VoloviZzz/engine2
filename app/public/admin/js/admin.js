function Fragments() {
    this.$addFragmentBtn = $('.js-add-fragment')
    this.$componentSelect = $('.js-upd-fragment-component');

    this.init();
}

Fragments.prototype.init = function () {
    this.$addFragmentBtn.on('click', this.add.bind(this));
    this.$componentSelect.on('change', this.changeComponent.bind(this));
}

Fragments.prototype.add = function () {
    
    const route_id = this.dataset.id;

    $.post("/api/fragments/add", { route_id }).done((result) => {
        console.log(result);
        if (result.status === 'ok') return location.reload();
    })
}

Fragments.prototype.changeComponent = function () {
    
    const fragment_id = this.dataset.fragmentId;
    const value = this.value;
    const target = 'component_id';

    $.post('/api/fragments/upd', { value, target, fragment_id }).done((result) => {
        if(result.status === 'ok') return location.reload();

        alert(result.message);
    }).catch((error) => {
        alert('Произошла ошибка. Попробуйте позже');
    })
}

const fragments = new Fragments();