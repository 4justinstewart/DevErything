#does both the favoriting and the unfavoriting
post "/favorites" do
  if params[:checkbox] == "true"
    current_user.favorites << Favorite.create!(user_id: current_user.id, post_id: params[:post_id])
    puts "USER FAVORITES AFTER CREATION"
    p current_user.favorites
  elsif params[:checkbox] == "false"
    puts "USER FAVORITES AFTER DESTRUCTION"
    Favorite.destroy_all(post_id: params[:post_id], user_id: current_user.id)
  end
  return "ajax ok"
end
