$(document).ready(function () {

	var currentSlide = sessionStorage.lastSlide || 0;

	$('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		initialSlide: currentSlide * 1,
		swipe: false,
		asNavFor: '.slider-nav'
	});

	$('.slider-nav').slick({
		slidesToShow: 5,
		slidesToScroll: 1,
		arrows: true,
		dots: false,
		asNavFor: '.slider-for',
		focusOnSelect: true,
		initialSlide: currentSlide * 1,
		responsive: [
			{
				breakpoint: 1150,
				settings: {
					slidesToShow: 3,
					infinite: true,
					dots: false,
				}
			},
			{
				breakpoint: 1300,
				settings: {
					slidesToShow: 4,
					infinite: true,
					dots: false,
				}
			}
		]
	}).on("mousewheel", function (event) {
		event.preventDefault();
		if (event.deltaX > 0 || event.deltaY < 0) {
			$(this).slick("slickNext");
		} else if (event.deltaX < 0 || event.deltaY > 0) {
			$(this).slick("slickPrev");
		}
	}).on('afterChange', function (event, slick, currentSlide) {
		sessionStorage.setItem('lastSlide', currentSlide);
	})

	setSlidersSize();

	$(window).on('resize', function (e) {
		setTimeout(function () {
			setSlidersSize();
		}, 0);
	});

	function setSlidersSize() {
		sliderItemHeight = ($(window).height() - $('.document-header').outerHeight(true) - $('.document-footer').outerHeight(true)) * 0.6;
		carouselItemHeight = ($(window).height() - $('.document-header').outerHeight(true) - $('.document-footer').outerHeight(true)) * 0.4;

		$('.slider-for').css({ height: sliderItemHeight });
		$('.slider-nav').css({ height: carouselItemHeight });
	}


	$('.js-slide-add').on('click', function (e) {
		e.stopPropagation();
		e.preventDefault();
		return false;
	});

	$('.js-slide-delete').on('click', function (e) {
		e.stopPropagation();
		e.preventDefault();
		return false;
	});

	// Открытие закрытие мобильного слайдера
	$('.accordeon-menu__item-link').click(function (e) {
		e.preventDefault();
		$('.accordeon-menu__item').removeClass('accordeon-menu__item--active');
		$(this).parent(".accordeon-menu__item").addClass('accordeon-menu__item--active');
	});
});