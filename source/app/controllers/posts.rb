enable :sessions

get '/posts' do
  @params = params[:id]
  @header = "Resource HQ"
  @posts = Post.all
  @categories = Category.all
  erb :'posts/index'
end

get '/posts/all' do
  redirect to '/posts'
end

get '/users/:user_id/posts' do
  @header = "#{current_user.first_name}'s Dashboard"
  @button_route = "/posts"
  @button_text = "See All Resources"
  @posts = current_user.posts
  @categories = Category.all
  erb :'users/posts'
end

get '/users/:user_id/posts/new' do
  @header = "Post a New Resource"
  @categories = Category.all

  erb :'posts/create'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @header = @post.title
  @source = @post.url
  @tags = @post.tags
  @post_vote = current_user.votes.find_by_post_id(@post.id)
  @vote_total = @post.calculate_vote_total
  erb :'posts/show'
end

post '/posts' do
  new_post = Post.create(params[:post])
  tag_names = params[:tagnames].split(', ')
  new_post.create_tag_associations(tag_names)

  redirect to "/users/#{session[:user_id]}/posts"
end

get '/users/:user_id/posts/:id/update' do
  @header = "Edit your Post"
  @categories = Category.all
  @post = Post.find(params[:id])
  @tags = @post.tags
 
  erb :'posts/update'
end

patch '/posts/:id' do
  post_to_edit = Post.find(params[:id])
  post_to_edit.update_attributes(params[:post])
  tag_names = params[:tagnames].split(', ')
  post_to_edit.create_tag_associations(tag_names)

  redirect "/posts/#{post_to_edit.id}"
end

get '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy

  redirect to "/users/#{current_user.id}/posts"
end


#------------------------------------added by rohan

post '/get_tags' do

  puts "I AM HERE"
  tags_array = []
  Tag.all.each do |tag|
    tags_array.push(tag.name)
  end

  return tags_array.to_json

end

















