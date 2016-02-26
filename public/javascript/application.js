$(document).ready(function() {
  $('select').material_select();

  $.ajax('/time').done(function (time) {
    var countdown = time;
    setInterval(function () {
      $('.expiration').text(countdown);

    },1000);
  });

});
