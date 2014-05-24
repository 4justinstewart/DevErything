get '/tags' do


end

get '/tags/new' do


end

post '/tags' do


end


get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @tag_name = @tag.name.gsub(',', '').upcase
  @header = "All Posts with #{@tag_name}"
  @posts = @tag.posts
  erb :'posts/posts_by_tag'
end


get '/photos/:id/edit' do


end

patch '/photos/:id' do


end

delete '/photos/:id' do


end

#-----------------------adding search function -------------------------

post '/search' do
  name = params[:tag]
  tag = Tag.find_by_name(name)
  tag_id = tag.id
  hash = Post.find_all_posts_by_tag(tag_id, current_user.id)

  return hash.to_json
end










