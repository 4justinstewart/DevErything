class User < ActiveRecord::Base
  has_many :posts
  has_many :favorites
  has_many :votes

  # validates :first_name, :last_name, :email, presence: true
  

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    return @user if @user && @user.password == password
    return nil
  end

end
