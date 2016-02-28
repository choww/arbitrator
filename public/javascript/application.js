$(document).ready(function() {
  $('select').material_select();

  $('.button-collapse').sideNav();

  $('.delete-form').submit(function(e) {
    e.preventDefault();

    var qid = $(this).attr('question-id');
    $.post('/questions/' + qid + '/delete', {_method: 'delete'}).done(
      console.log('success')
    );
    $(this).closest('.question-container').remove();
    });


  $('.thumb-up').click(function() {
    var thumb = (this);
    var qid = $(this)[0].id;
    var value = $(this)[0].value;
    $.post('/questions/' + qid + '/vote', {option: value}).done(function (vote) {
      $(thumb).closest('.question-container').find('.left-vote').text(vote[0]);
      $(thumb).closest('.question-container').find('.right-vote').text(vote[1]);
    });
    if (value == 0) {
      $(thumb).closest('.question-container').find('.right-button').children().addClass('red accent-2');
      $(thumb).closest('.question-container').find('.right-button').children().removeClass('green darken-1');
      $(thumb).closest('.question-container').find('.right-button').children().html("<i class='check material-icons'>thumb_up</i>");
    } else if (value == 1) {
      $(thumb).closest('.question-container').find('.left-button').children().addClass('red accent-2');
      $(thumb).closest('.question-container').find('.left-button').children().removeClass('green darken-1');
      $(thumb).closest('.question-container').find('.left-button').children().html("<i class='check material-icons'>thumb_up</i>");;
    }
    $(thumb).html("<i class='check material-icons'>done</i>");
    $(thumb).addClass('green darken-1');
    $(thumb).removeClass('red accent-2');
  });

  $.timeago.settings.allowFuture = true;
  $("time.timeago").timeago();
});
