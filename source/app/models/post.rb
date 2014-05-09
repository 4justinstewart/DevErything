class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  # validates :title, allow_blank: false
  # validates :content, allow_blank: false

  belongs_to :user
  belongs_to :category
  has_many :favorites
  has_many :votes
  has_many :taggings
  has_many :tags, :through => :taggings

  def self.get_posts_with_tag(tag_id, user_id)
    hash_cats = {}
    # hash_posts = {}
    Post.all.each do |post|
      cat_id = post.category.id
      post.taggings.each do |tagging|
        if tagging.tag_id == tag_id
          # hash_cats[post.category.name] = {post.id => post.title}
          hash_cats[post.category.name] = [post.id, post.title, post.is_favorite(user_id)]
        end
      end
    end
    return hash_cats
  end

#almost exact method exists in helper (not dry)
  def is_favorite(user_id)
    if (Favorite.where(post_id: self.id, user_id: user_id)).empty? == true
      return ""
    else
      return "checked"
    end
  end


  def self.sort_by_votes(category)
    sorted_by_category = Post.where("category_id = #{category.id}")
    post_votes = {}

    sorted_by_category.each do |post|
      post_upvotes = post.votes.where("upvote = true").count
      post_downvotes = post.votes.where("downvote = true").count
      post_vote_differential = post_upvotes - post_downvotes

      post_votes[post] = post_vote_differential
    end

    post_votes.sort_by { |key, value| value }.reverse.flatten.delete_if { |x| x.is_a? Integer }
  end


end
