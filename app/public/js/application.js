$(document).ready(() => {
	$('.header-nav .toggle-menu.btn').on('click', function (e) {
		$('.menu-container').toggleClass('menu-container__active');
	})

	const tabs = document.querySelectorAll(".tab");
	const contents = document.querySelectorAll(".tab-content");
	const $tabsWrap = $(".tabs-titles-wrap");
	const activeClass = "active";

	$tabsWrap.on("click", e => {
		if (e.target.classList.contains("tab")) {
			[...tabs].forEach((tab, tabIndex, tabArray) => {
				tab.classList.remove(activeClass);
				contents[tabIndex].classList.remove(activeClass);
				if (e.target === tab) {
					tab.classList.add(activeClass);
					contents[tabIndex].classList.add(activeClass);
				}
			});
		}
	});
})

// ----------------------------------------------------------------------------------------
function Shop() { };

Shop.prototype.addCategories = function (data = {}) {

	defaultData = {
		level: 0,
		paretn_id: false
	}

	data = Object.assign(defaultData, data);

	$.post(`/api/shop/addCategories`, data).done(result => {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
};

Shop.prototype.updCategories = function ({ id, target, value }) {
	$.post(`/api/shop/updCategories`, { id, target, value }).done(result => {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}
	});
}

Shop.prototype.delCategories = function ({ id }) {
	$.post(`/api/shop/delCategories`, { id }).done(result => {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
}

Shop.prototype.setPhoto = function ({ id, target, value }) {
	$.post(`/api/shop/updCategories`, { id, target, value }).done(result => {
		if (result.status !== 'ok') {
			console.log(result);
			return alert(result.message);
		}

		return location.reload();
	});
}

Shop.prototype.addPosition = function ({ cat_id = false }) {

	if (!!cat_id === false) return alert('Отсутствует или неправильный параметр cat_id');

	$.post(`/api/shop/addProduct`, { cat_id }).done(result => {
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
	const returnData = {};
	$(form).serializeArray().map(v => returnData[v.name] = v.value);
	return returnData;
};
// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function Slider() { };

Slider.prototype.deleteSlide = function ({ slide_id, fragment_id }) {
	$.post('/api/slider/deleteSlide', { slide_id, fragment_id }).done((result) => {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

Slider.prototype.updSlide = function ({ slide_id, fragment_id, target, value }) {
	$.post('/api/slider/updSlide', { slide_id, fragment_id, target, value }).done((result) => {
		if (result.status != 'ok') {
			console.log(result);
			alert(result.message);
		}
	})
}

Slider.prototype.setImage = function ({ slide_id, fragment_id, target, value }) {
	$.post('/api/slider/updSlide', { slide_id, fragment_id, target, value }).done((result) => {
		if (result.status != 'ok') {
			console.log(result);
			alert(result.message);
		}

		return location.reload();
	})
}
// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function Fragments() { }

Fragments.prototype.add = function ({ route_id, block_id }) {
	$.post("/api/fragments/add", { route_id, block_id }).done((result) => {
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

Fragments.prototype.setData = function ({ fragment_id, data }) {
	$.post('/api/fragments/setData', { fragment_id, data: JSON.stringify({ body: data }) }).done(result => {
		console.log(result);
	})
}

// ----------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------
function MenuList() { }
MenuList.prototype.addMenuItem = function ({ title, parent_id = null, href, menu_id }) {
	$.post('/api/menu/addMenuItem', { title, parent_id, href, menu_id }).done(result => {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

MenuList.prototype.addMenuGroup = function ({ title, route_id }) {
	$.post('/api/menu/addMenuGroup', { title, route_id }).done(result => {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

MenuList.prototype.deleteMenuItem = function ({ menu_id }) {
	$.post('/api/menu/deleteMenuItem', { menu_id }).done(result => {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

MenuList.prototype.updMenuItem = function ({ id, target, value }) {
	$.post('/api/menu/updMenuItem', { id, target, value }).done(result => {
		if (result.status == 'ok') return;

		console.log(result);
		alert(result.message);
	})
}
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
	})
}

RoutesList.prototype.addRoute = function (data) {
	$.post('/api/routes/add', data).done(function (result) {
		if (result.status == 'ok') {
			return location.reload();
		}

		console.log(result);
		return alert(result.message);
	})
}
RoutesList.prototype.updRoute = function (data) {
	$.post('/api/routes/upd', data).done(function (result) {
		if (result.status == 'ok') return location.reload();

		console.log(result);
		return alert(result.message);
	})
}

RoutesList.prototype.showEditForm = function (elem) {
	const $this = $(elem);
	const $routeItem = $this.parent('.js-route-item');

	$routeItem.toggleClass('js-edit-form--show');
}
// ----------------------------------------------------------------------------------------