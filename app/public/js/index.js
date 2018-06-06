
document.addEventListener('DOMContentLoaded', function(){
  $('.accordeon-menu__item-link').click(function(e){
      e.preventDefault();
      $('.accordeon-menu__item').removeClass('accordeon-menu__item--active');
      $(this).parent(".accordeon-menu__item").addClass('accordeon-menu__item--active');
  });
})
