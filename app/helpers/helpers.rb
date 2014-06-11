helpers do

  def get_popular_posts(cat)
    Post.where(category_id: cat).order("vote_count DESC").slice(0..9)
  end

  def get_loser_posts(cat)

    loser_posts = Post.where(category_id: cat)
    if loser_posts.length < 10
      return []
    else
      return loser_posts.order("vote_count DESC").slice(10..loser_posts.length)
    end
  end

end
