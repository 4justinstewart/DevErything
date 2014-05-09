$(function() {
  $('[class^="all_resource"]').hide();

  $('[id= "img0"]').on("click", function() {
    var loserPosts = $('.all_resource0').html()
    $('.resource_col0').append(loserPosts);
  });

  $('[id= "img1"]').on("click", function() {
    $('.resource_col1, .all_resource1').toggle(5);
  });

  $('[id= "img2"]').on("click", function() {
    $('.resource_col2, .all_resource2').toggle(5);
  });

  $('[id= "img3"]').on("click", function() {
    $('.resource_col3, .all_resource3').toggle(5);
  });

  $('[id= "img4"]').on("click", function() {
    $('.resource_col4, .all_resource4').toggle(5);
  });

  $('[id= "img5"]').on("click", function() {
    $('.resource_col5, .all_resource5').toggle(5);
  });
});
