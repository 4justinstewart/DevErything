helpers do
  def is_favorite(post_id, user_id)
    if (Favorite.where(post_id: post_id, user_id: user_id)).empty? == true
      return ""
    else
      return "checked"
    end
  end
end
