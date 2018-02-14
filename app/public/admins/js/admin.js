$(document).ready(() => {
	const fragments = new Fragments();
	const menuList = new MenuList();
	const routesList = new RoutesList();
	const slider = new Slider();
	const shop = new Shop();

	$('.js-goodsPositions-add').on('click', function (e) {
		const cat_id = $(this).data('catId');
		return shop.addPosition({ cat_id });
	})

	$('.js-goodsCategories-add').on('click', function (e) {
		const level = $(this).data('level') || 0;
		const parent_id = $(this).data('parentId') || false;

		return shop.addCategories({ level, parent_id });
	})

	$('.js-goodsCategories-upd').on('input', function (e) {
		const id = $(this).data('id');
		const target = $(this).data('target');
		const value = $(this).val().trim();

		if (!!target === false || !!value === false || !!id === false) {
			console.log('target: ', target, 'value: ', value, 'id: ', id);
			return alert('Что-то не так с данными');
		}

		return shop.updCategories({ id, target, value });
	})

	$('.js-goodsCategories-delete').on('click', function (e) {
		const id = $(this).data('id');

		if (!confirm('Удалить данную категорию с сайта?')) return false;

		return shop.delCategories({ id });
	})

	$('.js-goodsCategories-addPhoto').on('change', function (e) {
		const id = $(this).data('id');
		const target = $(this).data('target');

		const fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/shop/setImage',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success(result) {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}
				const value = result.data.fileUrl;
				return shop.setPhoto({ id, target, value });
			}
		});

		return false;
	})
	// -----------------------------------------------------------------------------

	$('.js-headerNav-edit').on('input', function (e) {
		const id = $(this).data('id');
		const target = $(this).data('target');
		const value = $(this).val().trim();

		$.post('/api/headerNav/upd', { id, target, value }).done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		})
	})

	$('.js-headerNav-add').on('click', function (e) {
		$.post('/api/headerNav/add').done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		})
	})

	$('.js-headerNav-delete').on('click', function (e) {
		const id = $(this).data('id');

		$.post('/api/headerNav/delete', { id }).done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		})
	})

	$('.js-slide-addSlidePhoto').on('change', function (e) {
		const slide_id = $(this).data('slideId');
		const fragment_id = $(this).data('fragmentId');
		const target = $(this).data('target');

		const fd = new FormData();

		fd.append('upload', this.files[0])

		$.ajax({
			url: '/api/slider/setImage',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success(result) {
				const value = result.data.fileUrl;
				return slider.setImage({ slide_id, fragment_id, target, value });
			}
		});

		return false;
	})

	$('.js-routesList-setMenu').on('change', function () {
		const { id, target } = $(this).data();
		const value = $(this).val().trim();

		routesList.updRoute({ id, target, value });
	})

	$('.js-slide-upd').on('input', function (e) {
		const slide_id = $(this).data('id');
		const fragment_id = $(this).data('fragmentId');
		const target = $(this).data('target');
		const value = $(this).val().trim();

		return slider.updSlide({ slide_id, fragment_id, target, value });
	})

	$('.js-slide-delete').on('click', function (e) {
		const slide_id = $(this).data('id');
		const fragment_id = $(this).data('fragmentId');

		return slider.deleteSlide({ slide_id, fragment_id });
	})

	$('.js-slide-moveSlide').on('click', function (e) {
		const slide_id = $(this).data('id');
		const current_position = $(this).data('currentPosition');
		const fragment_id = $(this).data('fragmentId');
		const move_position = +current_position + +this.dataset.vector;

		$.post('/api/slider/moveSlide', { slide_id, current_position, move_position, fragment_id }).done(data => {
			if (data.status !== 'ok') {
				console.log(data);
				return alert(data.message);
			}

			return location.reload();
		})

		return false;
	})

	$('.js-upd-fragment-component').on('change', function () {
		return fragments.changeComponent(this.dataset.fragmentId, this.value);
	})

	$('.js-add-fragment').on('click', function () {
		return fragments.add({ route_id: this.dataset.id, block_id: this.dataset.blockId });
	})

	$('.js-fragment-delete').on('click', function () {
		return fragments.delete(this.dataset.fragmentId);
	})

	$('.js-ckeditor-edit').each((i, elem) => {
		CKEDITOR.replace(elem);
	})

	$.each(CKEDITOR.instances, (i, elem) => {
		elem.on('change', function () {
			const editorData = this.getData();
			const editorElement = this.element.$;
			fragments.setData({ fragment_id: editorElement.dataset.fragmentId, data: editorData });
		})
	})

	$(".fragment-setting-window .setting-call-btn").click(function () {
		$(this).parents(".fragment-setting-window").toggleClass("setting-wrapper-show");
	})

	$('.js-menuItem-add').on('click', function () {
		const title = $('#js-menuItem-add--text').val().trim();
		const href = $('#js-menuItem-add--href').val().trim();
		const menu_id = $(this).data('menuId');
		const parent_id = 0;

		return menuList.addMenuItem({ title, parent_id, href, menu_id });
	})

	$('.js-menuGroup-add').on('click', function () {
		const title = $('#js-menuGroup-add--text').val().trim();
		const route_id = $(this).data('routeId');

		if (title == '') return alert("Отсутствует название группы");

		return menuList.addMenuGroup({ title, route_id });
	})

	$('.js-menuItem-delete').on('click', function () {
		const menu_id = $(this).data('menuId');

		return menuList.deleteMenuItem({ menu_id });
	})

	$('.js-menuItem-edit').on('input', function () {
		const id = $(this).data('id');
		const target = $(this).data('target');
		const value = $(this).val().trim();

		return menuList.updMenuItem({ id, target, value });
	})

	$('.js-slide-add').on('click', function (e) {
		const fragment_id = $(this).data('fragmentId')
		$.post('/api/slider/add', { fragment_id }).done(result => {
			if (result.status == 'ok') return location.reload();
		})
	})

	// ------------------------------------------
	$('.js-set-siteConfig').on('change', function (e) {

		const target = $(this).data('target');
		const value = $(this).val();

		$.post('/api/globalSiteConfig/setValue', { target, value }).done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
		})
	})

	// редактирование иконок
	$('.js-socialLink-edit').on('change', function (e) {
		const target = $(this).data('target');
		const id = $(this).data('id');
		const value = $(this).val();

		$.post('/api/socialLinks/upd', { target, id, value }).done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
		})

		return false;
	})

	// Удаление иконок
	$('.js-socialLink-delete').on('click', function (e) {
		e.preventDefault()
		console.log('here');
		const id = $(this).data('id');

		$.post('/api/socialLinks/del', { id }).done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			} else {
				location.reload();
			}
		})

		return false;
	})

	// отмена скрытия формы, по клику на неё
	$('.js-social-link-form').on('click', function (e) {
		return false;
	})

	// показать форму редактирования ссылки на соц. сеть
	$('.js-social-btn').on('click', function (e) {
		$(this).find('.js-social-link-form').toggle();
		return false;
	});

	// добавить ссылку на социальную сеть
	$('.js-add-social-link').on('click', function (e) {
		$.post('/api/socialLinks/add').done((result) => {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			} else {
				location.reload();
			}
		})
		return false;
	});

	$('.js-siteLogo-file').on('change', function (e) {

		const fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: `/api/images/upload?filename=${this.files[0].name}`,
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success(result) {
				$.post('/api/globalSiteConfig/setValue', {target: 'siteLogo', value: result.data.fileUrl}).done((result) => {
					if(result.status !== 'ok') {
						console.log(result);
						alert(result.message)
					}
					else {
						location.reload();
					}
				})
			}
		});
		return false;
	})
})