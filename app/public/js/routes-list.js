$(document).ready(() => {
	function RoutesList() {}
	function Forms() {};
	
	const routesList = new RoutesList();
	const forms = new Forms();

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

	$('.js-delete-route').on('click', function() {
		return routesList.delete(this.dataset.routeId);
	});

	$('.js-show-edit-route-form').on('click', function() {
		return routesList.showEditForm(this);
	})

	$('.js-routes-list-add-route').on('submit', function(e) {
		e.preventDefault();
		const $form = $(this);
		const formData = forms.getFormData($form);

		routesList.addRoute(formData);
	})

	$('.js-routes-list-upd-route').on('submit', function(e) {
		e.preventDefault();
		const $form = $(this);
		const formData = forms.getFormData($form);

		routesList.addRoute(formData);
	})
})