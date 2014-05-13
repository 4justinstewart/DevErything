get '/tags' do


end

get '/tags/new' do


end

post '/tags' do


end


get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @tag_name = @tag.name.gsub(',', '').upcase
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
  p "THIS IS HAPPENING"
  p params[:tag]
  name = params[:tag]
  tag = Tag.find_by_name(name)
  p tag
  puts "THIS IS TAG ID"
  tag_id = tag.id
  hash = Post.get_posts_with_tag(tag_id, current_user.id)
  puts "HASH OF POSTS OF TAG BY CATEGORY"
  p hash

  # is_favorite()

  return hash.to_json
end










