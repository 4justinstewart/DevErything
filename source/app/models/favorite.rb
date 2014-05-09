class Favorite < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :post_id
end

#search bar
=begin



=end
#tags.where('name = <%')

