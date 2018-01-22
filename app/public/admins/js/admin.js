$(document).ready(() => {
	const fragments = new Fragments();
	const menuList = new MenuList();
	const routesList = new RoutesList();

	$('.js-routesList-setMenu').on('change', function() {
		const {id, target} = $(this).data();
		const value = $(this).val().trim();
		
		routesList.updRoute({id, target, value});
	})

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

	$('.js-menuItem-add').on('click', function() {
		const title = $('#js-menuItem-add--text').val().trim();
		const href = $('#js-menuItem-add--href').val().trim();
		const menu_id = $(this).data('menuId');
		const parent_id = 0;

		return menuList.addMenuItem({title, parent_id, href, menu_id});
	})

	$('.js-menuGroup-add').on('click', function() {
		const title = $('#js-menuGroup-add--text').val().trim();
		const route_id = $(this).data('routeId');

		if(title == '') return alert("Отсутствует название группы");

		return menuList.addMenuGroup({title, route_id});
	})

	$('.js-menuItem-delete').on('click', function() {
		const menu_id = $(this).data('menuId');

		return menuList.deleteMenuItem({menu_id});
	})

	$('.js-menuItem-edit').on('input', function() {
		const id = $(this).data('id');
		const target = $(this).data('target');
		const value = $(this).val().trim();

		return menuList.updMenuItem({id, target, value});
	})

	$('.js-slide-add').on('click', function(e) {
		const fragment_id = $(this).data('fragmentId')
		$.post('/api/slider/add', {fragment_id}).done(result => {
			if(result.status == 'ok') return location.reload();
		})
	})
})