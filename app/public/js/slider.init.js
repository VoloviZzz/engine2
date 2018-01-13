$(document).ready(function() {

	let sliderItemHeight, carouselItemHeight;
	let carouselItemsCount, carouselItemWidth;
	let windowWidth;

	windowWidth = $(window).width();

	carouselItemsCount = 3.5;

	if(windowWidth > 1600) {
		carouselItemsCount = 5.5;
	}

	carouselItemWidth = $('#carousel').width() / carouselItemsCount;

	$('.carousel-link__container').find('a').on('click', function(e) {
		e.stopPropagation()
	});

	$('#carousel li').css({width: carouselItemWidth});

	$('#carousel').flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshow: false,
		itemWidth: carouselItemWidth,
		itemMargin: 10,
		asNavFor: '#slider',
		mousewheel: true
	});

	$('#slider').flexslider({
		animation: "slide",
		controlNav: false,
		directionNav: false,
		touch: false,
		animationLoop: false,
		slideshow: false,
		sync: "#carousel",
	});

	$('#alert-slider').flexslider({
		animation: "slide",
		directionNav: true,
		animationLoop: false,
		slideshow: false,
	});

	setSlidersSize();

	// костыль для того, чтобы родительский элемент слайдера занимал весь экран;
	$('.slider-container').parent().css({flex: '1'});

	function setSlidersSize() {

		sliderItemHeight = ($(window).height() - $('.document-header').outerHeight(true) - $('.document-footer').outerHeight(true)) * 0.6;
		carouselItemHeight = ($(window).height() - $('.document-header').outerHeight(true) - $('.document-footer').outerHeight(true)) * 0.4 - 16;
		let alertContainerHeight;

		$('.slider-item').css({height: sliderItemHeight});
		$('.carousel-item').css({height: carouselItemHeight});

		if($('.alert-container').length) {
			let setAlertListHeight = setInterval(function() {
				if($('.alert-container').position().top > 0) {
					alertContainerHeight = sliderItemHeight - $('.alert-container').position().top;

					$('.alert-container').css({height: alertContainerHeight});
					clearInterval(setAlertListHeight);
				}
			}, 0);
		}
	}

	$(window).on('resize', function(e) {
		setTimeout(() => {
			setSlidersSize();
		}, 0);
	})

	$('.js-slide-add').on('click', function(e) {
		e.stopPropagation();
		e.preventDefault();
		return false;
	})
});
