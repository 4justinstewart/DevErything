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

get '/users/:user_id/posts' do  # erb file contains button to see all posts
  @header = "#{current_user.first_name}'s Dashboard"
  @button_route = "/posts"
  @button_text = "See All Resources"
  @posts = current_user.posts
  @categories = Category.all
  erb :'users/posts'
end

get '/users/:user_id/posts/new' do  # make a new post (HTML form view)
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
  erb :'posts/show'
  #show a particular post, to READ, UPDATE (button), or DELETE (button)
end

post '/posts' do
  @new_post = Post.create(params[:post])
  @tag_names = params[:tagnames].split(', ')

  #---------------------------------------------------
  # PUT IN MODEL:: @tags = get_tags(@tag_names)
  @tags = []
  @tag_names.each do |name|
    @tag = Tag.find_by_name(name)
    if @tag
      @tags << @tag
    else
      @new_tag = Tag.create(name: name)
      @tags << @new_tag
    end
  end

  #--------------------------------------------------
  @new_post.tags = @tags  # THIS IS WHERE THE TAGGINGS ARE DECLARED.
  redirect to "/users/#{session[:user_id]}/posts"

end

get '/users/:user_id/posts/:id/update' do
  @header = "Edit your Post"
  @categories = Category.all
  @post = Post.find(params[:id])
  @tags = @post.tags
  #HTML form rendered with existing post info
  erb :'posts/update'
end

patch '/posts/:id' do
  p params
  @post_to_edit = Post.find(params[:id])
  p @post_to_edit
  @post_to_edit.update_attributes(params[:post])

  @post_tags = @post_to_edit.tags
  @tag_names = params[:tagnames].split(', ')

  updated_tags = []
  @tag_names.each do |name|
    @tag = Tag.find_by_name(name)
    if @tag
      updated_tags << @tag
    else
      @new_tag = Tag.create(name: name)
      updated_tags << @new_tag
    end
  end
  @post_to_edit.tags = updated_tags

  redirect "/posts/#{@post_to_edit.id}"
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

















