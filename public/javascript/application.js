$(document).ready(function() {
  $('select').material_select();

  $.timeago.settings.allowFuture = true;
  $("time.timeago").timeago();
});
