class Post < ActiveRecord::Base
  validates :title, :content, presence: true

  belongs_to :user
  belongs_to :category
  has_many :favorites
  has_many :votes
  has_many :taggings
  has_many :tags, :through => :taggings

  def self.find_all_posts_by_tag(tag_id, user_id)

    posts_with_tag = {}
    searched_tag = Tag.find(tag_id).name

    Category.all.each do |cat|
      posts_with_tag[cat.name] = []
    end 

    Post.all.each do |post|
      post_category = Category.find(post.category_id).name
      post.tags.each do |post_tag|
        if post_tag.name == searched_tag
          posts_with_tag[post_category] << [post.id, post.title, post.is_favorite(user_id)]
        end
      end
    end 
    posts_with_tag
  end

#almost exact method exists in helper (not dry)
  def is_favorite(user_id)
    if (Favorite.where(post_id: self.id, user_id: user_id)).empty? == true
      return ""
    else
      return "checked"
    end
  end

  def calculate_vote_total
    downvotes = self.votes.where(downvote: true).count
    upvotes = self.votes.where(upvote: true).count
    
    upvotes - downvotes
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
