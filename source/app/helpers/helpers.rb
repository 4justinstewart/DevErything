helpers do

  def get_popular_posts(cat)
    Post.sort_by_votes(cat).slice(0..9)
  end

  def get_loser_posts(cat)
    length = Post.sort_by_votes(cat).length
    if length < 10
      return Post.sort_by_votes(cat)
    else
      return Post.sort_by_votes(cat).slice(10..length)
    end
  end



end
