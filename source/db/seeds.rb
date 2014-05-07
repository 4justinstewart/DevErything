require 'faker'
# require 'activesupport'

User.create(email: "me@example.com", password: "hello")

categories = %w(eBooks Articles Repos Videos CheatSheets Docs)
categories.each do |cat|
  Category.create(name: cat)
end


20.times do
  @name = Faker::Lorem.word
  Tag.create(name: @name)
end

5.times do
  title = Faker::Lorem.sentence(1).titleize.gsub!('.', '')
  url = Faker::Internet.url
  content = Faker::Lorem.paragraph(3)
  category = Category.all.sample
  Post.create(title: title, url: url, content: content, user_id: 1, category_id: category.id )
end

5.times do |i|
  @post = Post.find(i+1)
  @tags = Tag.all.sample(rand(5..15))
  @tags.each do |tag|
    Tagging.create(post_id: @post.id, tag_id: tag.id)
  end
end


