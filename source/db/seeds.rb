require 'faker'
# require 'activesupport'

User.create(email: "me@example.com", password: "hello")

tags = %w(API Ruby Object-Oreinted Parsing CSV Nokogiri HTTP Javascript CoffeeScript SQL ActiveRecord Rails Migrations Associations Validations, Method Class RoR Node JQuery Pairing Mentoring Meetup Networking HTML CSS Plugin Array Hash Enumerable Kernel Documentation Syntax ErrorHandling Exception Variable String Integer Number Blocks Procs Lambdhas Regex Conditional Operator Session CRUD Params Routes MVC View Controller Model Sinatra EngineeringEmpathy Database ORM LinkedList Stack Recursive Algorithms SaSS Gem)

categories = %w(Articles Docs Repos CheatSheets eBooks Videos)
categories.each do |cat|
  Category.create(name: cat)
end

20.times do
  @name = Faker::Lorem.word
  Tag.create(name: @name)
end

60.times do
  title = Faker::Lorem.sentence(1).titleize.gsub!('.', '')
  url = Faker::Internet.url
  content = Faker::Lorem.paragraph(3)
  category = Category.all.sample
  Post.create(title: title, url: url, content: content, user_id: 1, category_id: category.id)
end

5.times do |i|
  @post = Post.find(i+1)
  @tags = Tag.all.sample(rand(5..15))
  @tags.each do |tag|
    Tagging.create(post_id: @post.id, tag_id: tag.id)
  end
end





