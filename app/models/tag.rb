class Tag < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :taggings
  has_many :posts, :through => :taggings

end
