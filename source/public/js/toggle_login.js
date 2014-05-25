$(function() {
  $('.auth_button').on('click', function(){
    // $('#signin').hide();
    // $('#signup').show();
    // $(this).html('Sign In');

    $('.authenticate').toggle(600);
    console.log(this);
    $('.auth_button').toggle();
  });
});