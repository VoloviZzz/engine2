function Fragments() {}
function MenuList() {}
function RoutesList() {}
function Forms() {};

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

MenuList.prototype.addMenuItem = function({title, parent_id = null, href, menu_id}) {
	$.post('/api/menu/addMenuItem', {title, parent_id, href, menu_id}).done(result => {
		if(result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

MenuList.prototype.addMenuGroup = function({title, route_id}) {
	$.post('/api/menu/addMenuGroup', {title, route_id}).done(result => {
		if(result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

MenuList.prototype.deleteMenuItem = function({menu_id}) {
	$.post('/api/menu/deleteMenuItem', {menu_id}).done(result => {
		if(result.status == 'ok') return location.reload();

		console.log(result);
		alert(result.message);
	})
}

MenuList.prototype.updMenuItem = function({id, target, value}) {
	$.post('/api/menu/updMenuItem', {id, target, value}).done(result => {
		if(result.status == 'ok') return;

		console.log(result);
		alert(result.message);
	})
}

RoutesList.prototype.delete = function (routeId) {

	if (!confirm('Удалить маршрут с сайта?')) return false;

	if (!!routeId === false) {
		console.log("У кнопки отсутствует номер маршрута");
		return alert('Что-то пошло не так. Попробуйте позже');
	}

	$.post('/api/routes/del', { id: routeId }).done(function (result) {
		if (result.status == 'bad') {
			console.log(result);
			return alert('Что-то пошло не так. Попробуйте позже');
		}

		return location.reload();
	})
}

RoutesList.prototype.addRoute = function(data) {
	$.post('/api/routes/add', data).done(function (result) {
		if (result.status == 'bad') {
			console.log(result);
			return alert('Что-то пошло не так. Попробуйте позже');
		}

		return location.reload();
	})
}
RoutesList.prototype.updRoute = function(data) {
	$.post('/api/routes/upd', data).done(function (result) {
		if (result.status == 'ok') return location.reload(); 

		console.log(result);
		return alert('Что-то пошло не так. Попробуйте позже');
	})
}

RoutesList.prototype.showEditForm = function (elem) {
	const $this = $(elem);
	const $routeItem = $this.parent('.js-route-item');

	$routeItem.toggleClass('js-edit-form--show');
}

Forms.prototype.getFormData = function(form) {
	const returnData = {};
	$(form).serializeArray().map(v => returnData[v.name] = v.value);
	return returnData;
};

$('img').on('error', function(error) {
    console.log(error);
})