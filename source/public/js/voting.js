$(function(){
  $('[src="/images/down_arrow.svg"]').on('click', function(e) {
    e.preventDefault;
    var postId = $('[type="hidden"]').val();
    $.post('/votes', { upvote: false, downvote: true, post_id: postId }, function(res) {
      if (res === "200") {
        console.log("success");
        $('.vote').detach();
      }
    });
  });

  $('[src="/images/up_arrow.svg"]').on('click', function(e) {
    e.preventDefault;
    var postId = $('[type="hidden"]').val();
    $.post('/votes', { upvote: true, downvote: false, post_id: postId }, function(res) {
      if (res === "200") {
        console.log("success");
        $('.vote').detach();
      }
    });
  });
});
