$(function(){


  if ($('#search_form').length){ //the search engine only works if there is a search_form (ajax is not running all time; able to use submit button)
    var availableTags = [];

    $.ajax({
      type: "POST",
      url: "/get_tags",
      data: {value: "params"},
      success: function(response){
        availableTags = JSON.parse(response)
        // console.log(availableTags);
        $("#search_input").autocomplete({
          source: availableTags
        })
      }
    });


    // $(document).keydown(function(e){ //search engine responsive on enter
    //   if (e.keyCode === 13){
    //     $("#search_form").trigger("submit");
    //   }
    // })


     $("#search_form").submit(function(event){
      event.preventDefault();
      console.log("this is submitting");
      var searchTag = $("#search_input").val();
      console.log(searchTag);
      $('.smaller_container').empty();

      $.ajax({
        type: "POST",
        url: "/search",
        data: {tag: searchTag},
        success: function(response){
          var searchObj = JSON.parse(response);
          console.log(searchObj);
          Object.keys(searchObj).forEach(function(catKey){
            postObj = searchObj[catKey]
            console.log(catKey);
            $('.smaller_container').append("<div id="+catKey+"></div>");
            $('#'+catKey+'').append("<h2>"+catKey+"</h2>");
            // Object.keys(postObj).forEach(function(postKey){
              var postKey = postObj[0];
              // var postName = postObj[postKey];
              var postName = postObj[1];
              var postCheck = postObj[2];
              console.log("HERE THEY ARE");
              console.log(postKey);
              console.log(postName);
              console.log(postCheck);
              $('#'+catKey+'').append("<td colspan='5'><input class='checkbox' type='checkbox' name='option' value="+postKey+" "+postCheck+"><a href='/posts/"+postKey+"'>"+postName+"</a></td>");
              // '<input class="checkbox" type="checkbox" name="option" value='+postKey+' '+postCheck+'>'

  //----------------------------------------------------------------------------------
  $(".checkbox").on("click", function(e){
    var postID = $(this).val(); //can't use the .checkbox to get post_id => jquery will go find arbitray checkbox(all same class) so instead use $(this)
    if($(this).is(':checked')){ //have to use $this here for the same reason
      console.log("something is checked");
      console.log(postID);
      var favorite = "true"
    }
    else{
      console.log("unchecked");
      console.log(postID);
      var favorite = "false"
    }
      $.ajax({
        type: "POST",
        url: "/favorites",
        data: {checkbox: favorite, post_id: postID},
        success: function(response){
          console.log(response);
        }
      })
      // e.preventDefault(); DONT
  });
  //Must be way to abstract to exact function in favorites.js (delegation?)
  //Although works - but get validatoin error about user
//----------------------------------------------------------------------------------

            // })
          })
        }
      });
    });
 }//if else
}); //function

