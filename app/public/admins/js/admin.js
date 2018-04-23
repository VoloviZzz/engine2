'use strict';

$(document).ready(function () {
	var fragments = new Fragments();
	var menuList = new MenuList();
	var routesList = new RoutesList();
	var slider = new Slider();
	var shop = new Shop();

	var aceEditorsElements = $('.js-ace-editor');

	$.each(aceEditorsElements, function (index, elem) {
		var editor = ace.edit(elem);
		var $elem = $(elem);

		var fragmentId = $elem.data('fragment-id');

		editor.setTheme("ace/theme/monokai");
		editor.session.setMode("ace/mode/html");

		editor.session.on('change', function (delta) {
			var editorValue = editor.getValue();
			var postData = {};

			postData.fragment_id = fragmentId;
			postData.data = JSON.stringify({value: editorValue});

			$.post('/api/fragments/setData', postData).done(function(result) {
				if(result.status !== 'ok') {
					console.log(result);
					return alert(result.message)
				}
			})
		});
	})

	$('.js-goodsPositions-add').on('click', function (e) {
		var cat_id = $(this).data('catId');
		return shop.addPosition({ cat_id: cat_id });
	});

	$('.js-goodsCategories-add').on('click', function (e) {
		var level = $(this).data('level') || 0;
		var parent_id = $(this).data('parentId') || false;

		return shop.addCategories({ level: level, parent_id: parent_id });
	});

	$('.js-goodsCategories-upd').on('input', function (e) {
		var id = $(this).data('id');
		var target = $(this).data('target');
		var value = $(this).val().trim();

		if (!!target === false || typeof value == "undefined" || !!id === false) {
			console.log('target: ', target, 'value: ', value, 'id: ', id);
			return alert('Что-то не так с данными');
		}

		return shop.updCategories({ id: id, target: target, value: value });
	});

	$('.js-goodsCategories-delete').on('click', function (e) {
		var id = $(this).data('id');

		if (!confirm('Удалить данную категорию с сайта?')) return false;

		return shop.delCategories({ id: id });
	});

	$('.js-goodsCategories-addPhoto').on('change', function (e) {
		var id = $(this).data('id');
		var target = $(this).data('target');

		var fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/shop/setImage',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				if (result.status !== 'ok') {
					console.log(result);
					return alert(result.message);
				}
				var value = result.data.fileUrl;
				return shop.setPhoto({ id: id, target: target, value: value });
			}
		});

		return false;
	});
	// -----------------------------------------------------------------------------

	$('.js-headerNav-edit').on('input', function (e) {
		var id = $(this).data('id');
		var target = $(this).data('target');
		var value = $(this).val().trim();

		$.post('/api/headerNav/upd', { id: id, target: target, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}
		});
	});

	$('.js-headerNav-add').on('click', function (e) {
		$.post('/api/headerNav/add').done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		});
	});

	$('.js-headerNav-delete').on('click', function (e) {
		var id = $(this).data('id');

		$.post('/api/headerNav/delete', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				return alert(result.message);
			}

			return location.reload();
		});
	});

	$('.js-slide-addSlidePhoto').on('change', function (e) {
		var slide_id = $(this).data('slideId');
		var fragment_id = $(this).data('fragmentId');
		var target = $(this).data('target');

		var fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/slider/setImage',
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				var value = result.data.fileUrl;
				return slider.setImage({ slide_id: slide_id, fragment_id: fragment_id, target: target, value: value });
			}
		});

		return false;
	});

	$('.js-routesList-setMenu').on('change', function () {
		var _$$data = $(this).data(),
			id = _$$data.id,
			target = _$$data.target;

		var value = $(this).val().trim();

		routesList.updRoute({ id: id, target: target, value: value });
	});

	$('.js-slide-upd').on('change', function (e, CKvalue) {
		var slide_id = $(this).data('id');
		var fragment_id = $(this).data('fragmentId');
		var target = $(this).data('target');
		var value = $(this).val().trim();

		if (typeof CKvalue !== 'undefined') {
			value = CKvalue;
		}

		return slider.updSlide({ slide_id: slide_id, fragment_id: fragment_id, target: target, value: value });
	});

	$('.js-slide-delete').on('click', function (e) {
		var slide_id = $(this).data('id');
		var fragment_id = $(this).data('fragmentId');

		if (!confirm('Удалить слайд?')) return false;

		return slider.deleteSlide({ slide_id: slide_id, fragment_id: fragment_id });
	});

	$('.js-slide-moveSlide').on('click', function (e) {
		var slide_id = $(this).data('id');
		var current_position = $(this).data('currentPosition');
		var fragment_id = $(this).data('fragmentId');
		var move_position = +current_position + +this.dataset.vector;

		$.post('/api/slider/moveSlide', { slide_id: slide_id, current_position: current_position, move_position: move_position, fragment_id: fragment_id }).done(function (data) {
			if (data.status !== 'ok') {
				console.log(data);
				return alert(data.message);
			}

			return location.reload();
		});

		return false;
	});

	$('.js-upd-fragment-component').on('change', function () {
		return fragments.changeComponent(this.dataset.fragmentId, this.value);
	});

	$('.js-add-fragment').on('click', function () {
		return fragments.add({ route_id: this.dataset.id, block_id: this.dataset.blockId });
	});

	$('.js-fragment-delete').on('click', function () {
		return fragments.delete(this.dataset.fragmentId);
	});

	$('.js-ckeditor-edit').each(function (i, elem) {
		CKEDITOR.replace(elem);
	});

	$('.js-staticFragment-edit').on('change', function (e, data) {
		fragments.setData({ fragment_id: this.dataset.fragmentId, data: data });
	});

	$.each(CKEDITOR.instances, function (i, elem) {
		console.log(elem);
		elem.on('change', function () {
			var editorData = this.getData();
			var editorElement = this.element.$;
			$(editorElement).trigger('change', [editorData]);
		});
	});

	$(".fragment-setting-window .setting-call-btn").click(function () {
		$(this).parents(".fragment-setting-window").toggleClass("setting-wrapper-show");
	});

	$('.js-menuItem-add').on('click', function () {
		var title = $('#js-menuItem-add--text').val().trim();
		var href = $('#js-menuItem-add--href').val().trim();
		var menu_id = $(this).data('menuId');
		var parent_id = 0;

		return menuList.addMenuItem({ title: title, parent_id: parent_id, href: href, menu_id: menu_id });
	});

	$('.js-menuGroup-add').on('click', function () {
		var title = $('#js-menuGroup-add--text').val().trim();
		var route_id = $(this).data('routeId');

		if (title == '') return alert("Отсутствует название группы");

		return menuList.addMenuGroup({ title: title, route_id: route_id });
	});

	$('.js-menuItem-delete').on('click', function () {
		var menu_id = $(this).data('menuId');

		return menuList.deleteMenuItem({ menu_id: menu_id });
	});

	$('.js-menuItem-edit').on('input', function () {
		var id = $(this).data('id');
		var target = $(this).data('target');
		var value = $(this).val().trim();

		return menuList.updMenuItem({ id: id, target: target, value: value });
	});

	$('.js-slide-add').on('click', function (e) {
		var fragment_id = $(this).data('fragmentId');
		$.post('/api/slider/add', { fragment_id: fragment_id }).done(function (result) {
			if (result.status == 'ok') return location.reload();
		});
	});

	// ------------------------------------------
	$('.js-set-siteConfig').on('change', function (e) {

		var target = $(this).data('target');
		var value = $(this).val();

		$.post('/api/globalSiteConfig/setValue', { target: target, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
		});
	});

	// редактирование иконок
	$('.js-socialLink-edit').on('change', function (e) {
		var target = $(this).data('target');
		var id = $(this).data('id');
		var value = $(this).val();

		$.post('/api/socialLinks/upd', { target: target, id: id, value: value }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			}
		});

		return false;
	});

	// Удаление иконок
	$('.js-socialLink-delete').on('click', function (e) {
		e.preventDefault();
		console.log('here');
		var id = $(this).data('id');

		$.post('/api/socialLinks/del', { id: id }).done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			} else {
				location.reload();
			}
		});

		return false;
	});

	// отмена скрытия формы, по клику на неё
	$('.js-social-link-form').on('click', function (e) {
		return false;
	});

	// показать форму редактирования ссылки на соц. сеть
	$('.js-social-btn').on('click', function (e) {
		$(this).find('.js-social-link-form').toggle();
		return false;
	});

	// добавить ссылку на социальную сеть
	$('.js-add-social-link').on('click', function (e) {
		$.post('/api/socialLinks/add').done(function (result) {
			if (result.status !== 'ok') {
				console.log(result);
				alert(result.message);
			} else {
				location.reload();
			}
		});
		return false;
	});

	$('.js-siteLogo-file').on('change', function (e) {

		var fd = new FormData();

		fd.append('upload', this.files[0]);

		$.ajax({
			url: '/api/images/upload?filename=' + this.files[0].name,
			data: fd,
			processData: false,
			contentType: false,
			type: 'POST',
			success: function success(result) {
				$.post('/api/globalSiteConfig/setValue', { target: 'siteLogo', value: result.data.fileUrl }).done(function (result) {
					if (result.status !== 'ok') {
						console.log(result);
						alert(result.message);
					} else {
						location.reload();
					}
				});
			}
		});
		return false;
	});
});