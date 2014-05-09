require 'faker'
# require 'activesupport'

tags = %w(API Ruby Object-Oreinted Parsing CSV Nokogiri HTTP Javascript CoffeeScript SQL ActiveRecord Rails Migrations Associations Validations, Method Class RoR Node JQuery Pairing Mentoring Meetup Networking HTML CSS Plugin Array Hash Enumerable Kernel Documentation Syntax ErrorHandling Exception Variable String Integer Number Blocks Procs Lambdhas Regex Conditional Operator Session CRUD Params Routes MVC View Controller Model Sinatra EngineeringEmpathy Database ORM LinkedList Stack Recursive Algorithms SaSS Gem)

tags.each do |tag|
  Tag.create(name: tag)
end

categories = %w(Articles Docs Repos CheatSheets eBooks Videos)

categories.each do |cat|
  Category.create(name: cat)
end

# -------------------------FAKER DOCUMENTATION-----------------------
5.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  email = Faker::Internet.email
  @user = User.create(first_name: first, last_name: last, email: email , password: 'password')
  15.times do
    title = Faker::Lorem.sentence(1).titleize.gsub!('.', '')
    url = Faker::Internet.url
    content = Faker::Lorem.paragraph(3)
    category = Category.all.sample
    @post = Post.create(title: title, url: url, content: content, user_id: 1, category_id: category.id)
    5.times do |i|
      post_tags = Tag.all.sample(rand(5..15))
      @post.tags = post_tags
    end
  end
end





