// $(function() {
//   $('[id= "img0"]').on("click", function() {
//     $('.resource_col0').html('<% cat = @categories[0] %><h2><%= cat.name %></h2><img id="img<%= counter %>" src="/posts.svg" alt="All Posts"/><% Post.sort_by_votes(cat).each do |post| %><table><tr><td colspan="5"><a href="/posts/<%= post.id %>"><%=post.title%></a></td></tr></table><% end %>');
//   });
// });

$(function() {
  $('[id= "img0"]').on("click", function() {
    $.get('/posts', { id: 0 } );
  });
});
