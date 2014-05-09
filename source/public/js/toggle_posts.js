$(function() {
  // $('[class^="all_resource"]').hide();

  // $('[id= "img0"]').on("click", function() {
  //   var loserPosts = $('.all_resource0').html()
  //   $('.resource_col0').append(loserPosts);
  // });

  // $('[id= "img1"]').on("click", function() {
  //   $('.resource_col1, .all_resource1').toggle(5);
  // });

  // $('[id= "img2"]').on("click", function() {
  //   $('.resource_col2, .all_resource2').toggle(5);
  // });

  // $('[id= "img3"]').on("click", function() {
  //   $('.resource_col3, .all_resource3').toggle(5);
  // });

  // $('[id= "img4"]').on("click", function() {
  //   $('.resource_col4, .all_resource4').toggle(5);
  // });

  // $('[id= "img5"]').on("click", function() {
  //   $('.resource_col5, .all_resource5').toggle(5);
  // });

  // $(".show_loser").detach();
  // $(".show_loser").hide();

  $('.image').on("click", function(){
    console.log("oh hai");
    var showLoser = $(this).parent().children(".show_loser")
    // console.log(showLoser);
    // showLoser.toggleClass()
    // console.log(showLoser.css());
    // showLoser.show();
    // console.log($(this).parent().children(".show_loser").show().;
  showLoser.toggle(function () {
    $("showLoser").css({display: "none"});
}, function () {
    $("showLoser").css({display: "inline-block"});
});

  })





  // $("#img1").on("click", function(){
  //   console.log("clicking on img 1");
  //   $(".resrouce_col").show(".all_resource");
  // })


});


