var loader;

$(document).ready(function () {
  $('iframe').attr('src','/uploads/panorams/index.html');
  $.post('/api/panorams/getZip', {})
  .done(function (result) {
    console.log(result);
  });

  // loader.load('files.zip://Resources.png')
});
