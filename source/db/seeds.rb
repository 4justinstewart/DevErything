require 'faker'
# require 'activesupport'

User.create(email: "me@example.com", password: "hello")

20.times do
  @name = Faker::Lorem.word
  Tag.create(name: @name)
end

5.times do
  @title = Faker::Lorem.sentence(1).titleize.gsub!('.', '')
  @content = Faker::Lorem.paragraph(3)
  @author = Faker::Name.name
  Post.create(title: @title, content: @content, author: @author, user_id: 1)
end

5.times do |i|
  @post = Post.find(i+1)
  @tags = Tag.all.sample(rand(5..15))
  @tags.each do |tag|
    Tagging.create(post_id: @post.id, tag_id: tag.id)
  end
end
