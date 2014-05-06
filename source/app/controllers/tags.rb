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
  erb :posts_by_tag
end


get '/photos/:id/edit' do


end

patch '/photos/:id' do


end

delete '/photos/:id' do


end