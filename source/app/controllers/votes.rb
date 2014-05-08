get "/votes" do

end

get "/votes/new" do


end

post "/votes" do  #CREATE VOTE OBJ.
  p params
  Vote.create(
    user_id: current_user.id,
    post_id: params[:post_id].to_i,
    upvote: params[:upvote],
    downvote: params[:downvote]
  )

  "200"
end

get "/votes/:id" do


end

get "/votes/:id/edit" do


end


patch "/votes/:id" do


end

delete"/votes/:id" do


end
