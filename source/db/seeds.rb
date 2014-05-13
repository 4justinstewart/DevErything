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

# -----------------------HARD CODED DOCUMENTATION---------------------

User.create(first_name: "Rohan", last_name: "Mathur", email: "rmathur101@gmail.com" , password: 'password')
User.create(first_name: "Justin", last_name: "Stewart", email: "justing@gmail.com" , password: 'password')

Post.create(title: "Getting Started With Ruby on Rails", url: "http://alistapart.com/article/gettingstartedwithrubyonrails", content: "Rails against the machine!", category_id: "1", user_id: "1")
Post.create(title: "Ruby Enumerables", url: "http://www.ruby-doc.org/core-2.1.1/Enumerable.html", content: "I love ruby. I love enumerables.", category_id: "2", user_id: "1")
Post.create(title: "Devrything is everything you need.", url: "https://github.com/4justinstewart/DevErything", content: "You can help make devrything better! Contribute!", category_id: "3", user_id: "1")
Post.create(title: "Sublime Cheat Sheet", url: "http://www.cheatography.com/example42/cheat-sheets/sublime-text-2-shortcuts-os-x/", content: "No one likes finger typers.", category_id: "4", user_id: "1")
Post.create(title: "GANGNAM STYLE", url: "http://www.youtube.com/watch?v=9bZkp7q19f0&feature=kp", content: "This is relevant. I promise.", category_id: "6", user_id: "1")
Post.create(title: "Learn Node.js", url: "https://github.com/jkymarsh", content: "This guy knows some javascripts.", category_id: "3", user_id: "1")

Tagging.create(post_id: 1, tag_id: 2)
Tagging.create(post_id: 1, tag_id: 12)
Tagging.create(post_id: 1, tag_id: 18)
Tagging.create(post_id: 1, tag_id: 3)

Tagging.create(post_id: 2, tag_id: 2)
Tagging.create(post_id: 2, tag_id: 18)
Tagging.create(post_id: 2, tag_id: 28)
Tagging.create(post_id: 2, tag_id: 29)
Tagging.create(post_id: 2, tag_id: 30)
Tagging.create(post_id: 2, tag_id: 32)

Tagging.create(post_id: 3, tag_id: 55)
Tagging.create(post_id: 3, tag_id: 24)

Tagging.create(post_id: 4, tag_id: 21)
Tagging.create(post_id: 4, tag_id: 27)

Tagging.create(post_id: 5, tag_id: 55)
Tagging.create(post_id: 5, tag_id: 22)
Tagging.create(post_id: 5, tag_id: 23)
Tagging.create(post_id: 5, tag_id: 24)

Tagging.create(post_id: 6, tag_id: 55)
Tagging.create(post_id: 6, tag_id: 24)



