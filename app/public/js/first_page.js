$(document).ready(function () {
  if ($(window).scrollTop() > 53) {
    $('.header').css('z-index', -1);
  }else {
    $('.header').css('z-index', 1);
  }
  $(window).on('scroll', function(){
    if ($(this).scrollTop() > 53) {
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
});
