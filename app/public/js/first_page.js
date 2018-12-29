$(document).ready(function () {
  if ($(window).scrollTop() > 53) {
    $('.header').css('z-index', -1);
  }else {
    $('.header').css('z-index', 1);
  }
  if ($(window).scrollTop() > 331) {
    $('.header').hide();
  }else {
    $('.header').show();
  }
  if ($(window).scrollTop() > 4000) {
    $('.fifth-logo').show(1000);
    $('.social').show(1000);
  }else {
    $('.social').hide(1000);
    $('.fifth-logo').hide(1000);
  }
  var lastScrollTop = $(window).scrollTop();
  $(window).on('scroll', function(e){
    st = $(this).scrollTop();
    if (st > 2900) {
        if(st < lastScrollTop) {
          if (parseInt($('.fourth').css('background-position-y')) < -2) {
            $('.fourth').css('background-position-y', parseInt($('.fourth').css('background-position-y'))+2+'px' )
          }
        }
        else {
          if (parseInt($('.fourth').css('background-position-y')) > -300) {
            $('.fourth').css('background-position-y', parseInt($('.fourth').css('background-position-y'))-2+'px' )
          }
        }
    }
    lastScrollTop = st;
    if (st > 4000) {
      $('.fifth-logo').show(1000);
      $('.social').show(1000);
    }else {
      $('.social').hide(1000);
      $('.fifth-logo').hide(1000);
    }
    if (st > 331) {
      $('.header').hide();
    }else {
      $('.header').show();
    }
    if (st > 53) {
      $('.header').css('z-index', -1);
    }else {
      $('.header').css('z-index', 1);
    }
  });
  $('.logo').hover(function () {
    $(this).attr('src', '/img/de_uro/Site-hat/Green.PNG');
  },
  function () {
    $(this).attr('src', '/img/de_uro/Site-hat/White.PNG');

  });

$('.open-menu-list').click(function () {
  console.log('click');
  if (parseInt($('.document-header .menu').css('height')) < 280) {
    $('.document-header .menu').css('height', '280px');
    $('.header-list-div').show()
    $('.menu-list').css('display', 'block');
  }else {
    $('.document-header .menu').css('height', '40px');
    $('.header-list-div').hide()
  }
});














});






































//-------------------------------------------------------------
