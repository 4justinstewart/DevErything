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

  def self.get_posts_with_tag(tag_id)
    hash_cats = {}
    # hash_posts = {}
    Post.all.each do |post|
      cat_id = post.category.id
      post.taggings.each do |tagging|
        if tagging.tag_id == tag_id
          hash_cats[post.category.id] = {post.id => post.title}
        end
      end
    end
    return hash_cats
  end
end
