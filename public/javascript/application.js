$(document).ready(function() {
  $('select').material_select();

  $('.thumb-up').click(function() {
    var thumb = (this);
    var qid = $(this)[0].id;
    var value = $(this)[0].value;
    $.post('/questions/' + qid + '/vote', {option: value}).done(function (vote) {
      // $(thumb).css('background-color','green');
      $(thumb).closest('.question-container').find('.left-vote').text(vote[0]);
      $(thumb).closest('.question-container').find('.right-vote').text(vote[1]);
    });
  });

  $.timeago.settings.allowFuture = true;
  $("time.timeago").timeago();
});
