enable :sessions

get '/posts' do
  #show all posts
  @header = "All the Posts"
  @button_route = "/users/#{session[:user_id]}/posts"
  @button_text = "See Your Posts"
  @posts = Post.all
  erb :'posts/index'
end

get '/users/:user_id/posts' do
# erb file contains button to see all posts
  @header = "Your Awesome Posts"
  @button_route = "/posts"
  @button_text = "See All Posts"
  @posts = current_user.posts
  erb :'posts/index'
end

get '/users/:user_id/posts/new' do
  # make a new post (HTML form view)
  erb :'posts/create'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @tags = @post.tags
  erb :'posts/show'
  #show a particular post, to READ, UPDATE (button), or DELETE (button)
end

# get '/users/:user_id/posts/:post_id' do
#   @post = Post.find(params[:post_id])
#   @tags = @post.tags
#   erb :'posts/show'
# end

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
  @new_post.tags = @tags
  redirect to "/users/#{session[:user_id]}/posts"
  # if not @new_post.errors.messages.empty?
  #   @error_messages = @new_post.errors.messages
  #   # @title_error ||= "Title "+ @error_messages[:title].first
  #   # @content_error ||= "Content "+@error_messages[:content]
  #   erb :'posts/create'
  # else
  #   redirect to '/posts'
  # end
end

get '/users/:user_id/posts/:id/update' do
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

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy

  redirect to "/users/#{session[:user_id]}/posts"
end
