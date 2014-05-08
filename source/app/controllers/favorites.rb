#does both the favoriting and the unfavoriting
post "/favorites" do
  puts "THES ARE FAVORITE PARAMS"
  p params
  if params[:checkbox] == "true"
    current_user.favorites << Favorite.create!(user_id: current_user.id, post_id: params[:post_id])
    puts "USER FAVORITES AFTER CREATION"
    p current_user.favorites
    # Favorite.create!(po)
  elsif params[:checkbox] == "false"
    puts "USER FAVORITES AFTER DESTRUCTION"
    Favorite.destroy_all(post_id: params[:post_id], user_id: current_user.id)
    p current_user.favorites
  end

  return "ajax ok"
end

#how do I handle favoriting things multiple times? (after they return to homepage and checkboxes empty)
#is there a way to display checks for the ones that the user has already checked after return to page


# post "/unfavorite" do
#   puts "THESE ARE UNFAVORITE"
#   p params
#   return "unfavorite"

# end
