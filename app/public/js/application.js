'use strict';

$(document).ready(function () {

	const App = {};
	window.App = App;

	$('.header-nav .toggle-menu.btn').on('click', function (e) {
		$('.menu-container').toggleClass('menu-container__active');
	});

	// ------------------ Вкладки --------------------------------
	var tabs = document.querySelectorAll(".tab");
	var contents = document.querySelectorAll(".tab-content");
	var $tabsWrap = $(".tabs-titles-wrap");
	var activeClass = "active";

	$tabsWrap.on("click", function (e) {
		if ($(e.target).hasClass("tab")) {
			$(contents).removeClass(activeClass);
			$(tabs).removeClass(activeClass);

			$(".tab").each(function (tabIndex, tab) {
				if (e.target === tab) {
					$(tab).addClass(activeClass);
					$(contents).eq(tabIndex).addClass(activeClass);
				}
			});
		}
	});
	// ------------------ Вкладки --------------------------------


	App.sendRequest = function (url, data) {
		return new Promise(function(resolve, reject) {
			
		})
	}
});

// ----------------------------------------------------------------------------------------
function Shop() { };

Shop.prototype.addCategories = function (data) {

	data = {};

	defaultData = {
		level: 0,
		paretn_id: false
	};

	data = Object.assign(defaultData, data);

	$.post('/api/shop/addCategories', data).done(function (result) {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
};

Shop.prototype.updCategories = function (_ref) {
	var id = _ref.id,
		target = _ref.target,
		value = _ref.value;

	$.post('/api/shop/updCategories', { id: id, target: target, value: value }).done(function (result) {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}
	});
};

Shop.prototype.delCategories = function (_ref2) {
	var id = _ref2.id;

	$.post('/api/shop/delCategories', { id: id }).done(function (result) {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
};

Shop.prototype.setPhoto = function (_ref3) {
	var id = _ref3.id,
		target = _ref3.target,
		value = _ref3.value;

	$.post('/api/shop/updCategories', { id: id, target: target, value: value }).done(function (result) {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
};

Shop.prototype.addPosition = function (_ref4) {
	var _ref4$cat_id = _ref4.cat_id,
		cat_id = _ref4$cat_id === undefined ? false : _ref4$cat_id;


	if (!!cat_id === false) return alert('Отсутствует или неправильный параметр cat_id');

	$.post('/api/goodsPosition/addProduct', { cat_id: cat_id }).done(function (result) {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
};

// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function Forms() { };

Forms.prototype.getFormData = function (form) {
	var returnData = {};
	$(form).serializeArray().map(function (v) {
		return returnData[v.name] = v.value;
	});
	return returnData;
};
// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function Slider() { };

Slider.prototype.deleteSlide = function (_ref5) {
	var slide_id = _ref5.slide_id,
		fragment_id = _ref5.fragment_id;

	$.post('/api/slider/deleteSlide', { slide_id: slide_id, fragment_id: fragment_id }).done(function (result) {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	});
};

Slider.prototype.updSlide = function (_ref6) {
	var slide_id = _ref6.slide_id,
		fragment_id = _ref6.fragment_id,
		target = _ref6.target,
		value = _ref6.value;

	$.post('/api/slider/updSlide', { slide_id: slide_id, fragment_id: fragment_id, target: target, value: value }).done(function (result) {
		if (result.status != 'ok') {
			console.log(result);
			alert(result.message);
		}
	});
};

Slider.prototype.setImage = function (_ref7) {
	var slide_id = _ref7.slide_id,
		fragment_id = _ref7.fragment_id,
		target = _ref7.target,
		value = _ref7.value;

	$.post('/api/slider/updSlide', { slide_id: slide_id, fragment_id: fragment_id, target: target, value: value }).done(function (result) {
		if (result.status != 'ok') {
			console.log(result);
			alert(result.message);
		}

		return location.reload();
	});
};
// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function Fragments() { }

Fragments.prototype.add = function (_ref8) {
	var route_id = _ref8.route_id,
		block_id = _ref8.block_id;

	$.post("/api/fragments/add", { route_id: route_id, block_id: block_id }).done(function (result) {
		if (result.status === 'ok') return location.reload();
		console.log(result);
		alert(result.message);
	});
};

Fragments.prototype.changeComponent = function (fragment_id, value) {

	var target = 'component_id';

	$.post('/api/fragments/upd', { value: value, target: target, fragment_id: fragment_id }).done(function (result) {
		if (result.status === 'ok') return location.reload();

		alert(result.message);
	}).catch(function (error) {
		alert('Произошла ошибка. Попробуйте позже');
	});
};

Fragments.prototype.delete = function (fragment_id) {
	$.post('/api/fragments/del', { fragment_id: fragment_id }).done(function (result) {
		if (result.status === 'ok') return location.reload();

		alert(result.message);
	}).catch(function (error) {
		alert('Произошла ошибка. Попробуйте позже');
	});
};

Fragments.prototype.setData = function (_ref9) {
	var fragment_id = _ref9.fragment_id,
		data = _ref9.data;

	$.post('/api/fragments/setData', { fragment_id: fragment_id, data: JSON.stringify({ body: data }) }).done(function (result) {
		console.log(result);
	});
};

// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function MenuList() { }
MenuList.prototype.addMenuItem = function (_ref10) {
	var title = _ref10.title,
		_ref10$parent_id = _ref10.parent_id,
		parent_id = _ref10$parent_id === undefined ? null : _ref10$parent_id,
		href = _ref10.href,
		menu_id = _ref10.menu_id;

	$.post('/api/menu/addMenuItem', { title: title, parent_id: parent_id, href: href, menu_id: menu_id }).done(function (result) {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	});
};

MenuList.prototype.addMenuGroup = function (_ref11) {
	var title = _ref11.title,
		route_id = _ref11.route_id;

	$.post('/api/menu/addMenuGroup', { title: title, route_id: route_id }).done(function (result) {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	});
};

MenuList.prototype.deleteMenuItem = function (_ref12) {
	var menu_id = _ref12.menu_id;

	$.post('/api/menu/deleteMenuItem', { menu_id: menu_id }).done(function (result) {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	});
};

MenuList.prototype.updMenuItem = function (_ref13) {
	var id = _ref13.id,
		target = _ref13.target,
		value = _ref13.value;

	$.post('/api/menu/updMenuItem', { id: id, target: target, value: value }).done(function (result) {
		if (result.status == 'ok') return;

		console.log(result);
		alert(result.message);
	});
};
// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function RoutesList() { }
RoutesList.prototype.delete = function (routeId) {

	if (!confirm('Удалить маршрут с сайта?')) return false;

	if (!!routeId === false) {
		console.log("У кнопки отсутствует номер маршрута");
		return alert('Что-то пошло не так. Попробуйте позже');
	}

	$.post('/api/routes/del', { id: routeId }).done(function (result) {

		if (result.status == 'ok') {
			return location.reload();
		}

		console.log(result);
		return alert(result.message);
	});
};

RoutesList.prototype.addRoute = function (data) {
	$.post('/api/routes/add', data).done(function (result) {
		if (result.status == 'ok') {
			return location.reload();
		}

		console.log(result);
		return alert(result.message);
	});
};
RoutesList.prototype.updRoute = function (data) {
	$.post('/api/routes/upd', data).done(function (result) {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		return alert(result.message);
	});
};

RoutesList.prototype.showEditForm = function (elem) {
	var $this = $(elem);
	var $routeItem = $this.parent('.js-route-item');

	$routeItem.toggleClass('js-edit-form--show');
};
// ----------------------------------------------------------------------------------------