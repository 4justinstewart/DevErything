class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  # validates :title, allow_blank: false
  # validates :content, allow_blank: false
  belongs_to :user
  has_many :taggings
  has_many :tags, :through => :taggings
end
