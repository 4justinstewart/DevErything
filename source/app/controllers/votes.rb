get "/votes" do

end

get "/votes/new" do


end

post "/votes" do  #CREATE VOTE OBJ.
  Vote.create(
    user_id: current_user.id,
    post_id: params[:post_id].to_i,
    upvote: params[:upvote],
    downvote: params[:downvote]
  )

  post = Post.find(params[:post_id])
  post.calculate_vote_total.to_json
end

get "/votes/:id" do


end

get "/votes/:id/edit" do


end


patch "/votes/:id" do


end

delete"/votes/:id" do


end
