function Fragments() { }

Fragments.prototype.add = function (route_id) {
	$.post("/api/fragments/add", { route_id }).done((result) => {
		if (result.status === 'ok') return location.reload();
		console.log(result);
		alert(result.message)
	})
}

Fragments.prototype.changeComponent = function (fragment_id, value) {

    const target = 'component_id';

	$.post('/api/fragments/upd', { value, target, fragment_id }).done((result) => {
		if (result.status === 'ok') return location.reload();

		alert(result.message);
	}).catch((error) => {
		alert('Произошла ошибка. Попробуйте позже');
	})
}

Fragments.prototype.delete = function (fragment_id) {
    $.post('/api/fragments/del', { fragment_id }).done((result) => {
        if (result.status === 'ok') return location.reload();

        alert(result.message);
    }).catch((error) => {
        alert('Произошла ошибка. Попробуйте позже');
    })
}

Fragments.prototype.setData = function({fragment_id, data}) {
	$.post('/api/fragments/setData', {fragment_id, data}).done(result => {
		console.log(result);
	})
}

const fragments = new Fragments();

$('.js-upd-fragment-component').on('change', function () {
    return fragments.changeComponent(this.dataset.fragmentId, this.value);
})

$('.js-add-fragment').on('click', function () {
    return fragments.add(this.dataset.id);
})

$('.js-fragment-delete').on('click', function () {
    return fragments.delete(this.dataset.fragmentId);
})

$('.js-ckeditor-edit').each((i, elem) => {
	CKEDITOR.replace(elem);
})

$.each(CKEDITOR.instances, (i, elem) => {
	elem.on('change', function() {
		const editorData = this.getData();
		const editorElement = this.element.$;
		fragments.setData({fragment_id: editorElement.dataset.fragmentId, data: editorData});
	})
})

$(".fragment-setting-window .setting-call-btn").click(function() {
    $(this).parents(".fragment-setting-window").toggleClass("setting-wrapper-show");
 })
