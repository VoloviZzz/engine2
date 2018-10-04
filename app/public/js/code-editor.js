$(document).ready(function () {
  $(document).on('keydown', function (e) {
		if (e.shiftKey && e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
			saveEditedFiles()
		}
	});

  $('.directory').click(function () {
    $('.'+$(this).find('span').text()).toggle(200);
  });

  // $('.show-editor').click(function () {
  //   $(this).find('.js-ace-editor').show(200);
  // });
  // $('.show-line-editors').click(function () {
  //   $('.show-editor').toggle(200);
  // });
  $('.save-editors').click(function () {
    saveEditedFiles()
  });
  // $('.addNewFile').click(function () {
  //   var file = prompt('Имя файла: ', 100);
  //   $.post('/api/codeEditor/addFile', {
  //       component: $('.code-editor').data('component'),
  //       name: file
  //     })
  //   .done(function (result) {
  //     console.log(result);
  //     if (result.status == 'ok') {
  //       $('.code-editor').append('<div class="show-editor"><div class="js-ace-editor ejs" data-lang = "'+file.split('.')[1]+'"> </div></div>');
  //       console.log('ok');
  //     }
  //   });
  // });

})

function saveEditedFiles() {
  $.post('/api/codeEditor/setFS', {
      component: $('.code-editor').data('component'),
      template: editors[1].getValue(),
      index: editors[0].getValue(),
      css: editors[2].getValue(),
      js: editors[3].getValue()
    })
  .done(function (result) {
    if (result.status == 'ok') {
      console.log('ok');
    }
  });
}
