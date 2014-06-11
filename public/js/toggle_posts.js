$(function() {

  $('.show_loser').css({display: "none"});

  $('.image').on("click", function(){
    var showLoser = $(this).parent().children(".show_loser")

    showLoser.toggle(function () {
      $("showLoser").show();
    },  function () {
      $("showLoser").hide();
    });
  });
});


