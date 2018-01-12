function Fragments() {}

Fragments.prototype.add = function (route_id) {
    $.post("/api/fragments/add", { route_id }).done((result) => {
        console.log(result);
        if (result.status === 'ok') return location.reload();
    })
}

Fragments.prototype.changeComponent = function (fragment_id, value) {
    
    const target = 'component_id';

    $.post('/api/fragments/upd', { value, target, fragment_id }).done((result) => {
        if(result.status === 'ok') return location.reload();

        alert(result.message);
    }).catch((error) => {
        alert('Произошла ошибка. Попробуйте позже');
    })
}

Fragments.prototype.delete = function(fragment_id) {
    console.log(this);
}

const fragments = new Fragments();

$('.js-upd-fragment-component').on('change', function() {
    return fragments.changeComponent(this.dataset.fragmentId, this.value);
})

$('.js-add-fragment').on('click', function() {
    return fragments.add(this.dataset.id);
})

$('.js-fragment-delete').on('click', function() {
    return fragments.delete(this.dataset.routeId);
})