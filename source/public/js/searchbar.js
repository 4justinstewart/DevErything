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


    $(document).keydown(function(e){ //search engine responsive on enter
      if (e.keyCode === 13){
        $("#search_form").trigger("submit");
      }
    })


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
          Object.keys(searchObj).forEach(function(catKey){
            postObj = searchObj[catKey]
            console.log(catKey);
            $('.smaller_container').append("<div id="+catKey+"></div>");
            $('#'+catKey+'').append("<h2>"+catKey+"</h2>");
            Object.keys(postObj).forEach(function(postKey){
              var postName = postObj[postKey];
              console.log(postName);
              $('#'+catKey+'').append("<a href='/posts/"+postKey+"'>"+postName+"</a>");


            })
          })
        }
      });
    });
 }//if else
}); //function

