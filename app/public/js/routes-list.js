$(document).ready(() => {
	function Routes() {}
	function Forms() {};

	Routes.prototype.delete = function (routeId) {

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

	Routes.prototype.showForm = function (elem) {
		const $this = $(elem);
		const $routeItem = $this.parent('.js-route-item');

		$routeItem.toggleClass('js-edit-form--show');
	}
	
	Forms.prototype.getFormData = function(form) {
		return $(form).serializeArray().map(v => {return {[v.name]: v.value}})
	};

	const routes = new Routes();
	
	$('.js-delete-route').on('click', function() {
		return routes.delete(this.dataset.routeId);
	});

	$('.js-show-edit-route-form').on('click', function() {
		return routes.showForm(this);
	})

})