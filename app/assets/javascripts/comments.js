var $answer_comment;
$(document).on('click','.answer-to-comment', function(e){
  e.preventDefault();
  $answer_comment = $answer_comment || $('#comment-form').clone().attr('id', 'comment-answer-form');
  $answer_comment.insertAfter($(this).closest('li')).find('#parent-comment-id').val($(this).closest('li').data('id'));
});