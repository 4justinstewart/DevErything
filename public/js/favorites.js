$(document).ready(function() {
  console.log("this works");
  $(".checkbox").on("click", function(e){

    var postID = $(this).val(); //can't use the .checkbox to get post_id => jquery will go find arbitray checkbox(all same class) so instead use $(this)

    if($(this).is(':checked')){ //have to use $this here for the same reason
      console.log("something is checked");
      console.log(postID);
      var favorite = "true";
    }
    else{
      console.log("unchecked");
      console.log(postID);
      var favorite = "false";
    }

      $.ajax({
        type: "POST",
        url: "/favorites",
        data: {checkbox: favorite, post_id: postID},
        success: function(response){
          console.log(response);
        }
      });
  });
});


