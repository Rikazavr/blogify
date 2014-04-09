$(document).ready(function(){
  $('.answer-to-comment').on('click', function(e){
    e.preventDefault();
    $('#comment-form').insertAfter($(this).closest('li')).find('#parent-comment-id').val($(this).closest('li').data('id'));
  });
});