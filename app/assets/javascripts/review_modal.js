$(function() {
  $(document).on('click', '.review_button', function() {
    $('.review_modal_wrapper').show();
    $('.review_modal').show();
});

  $(document).on('click', '.review_modal_wrapper, .fa_wrapper', function() {
    $('.review_modal_wrapper').hide();
    $('.review_modal').hide();
    $('.review_modal_content').hide();
  });
});