# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Article.destroy_all
Category.destroy_all
Comment.destroy_all

10.times do
  user = User.new
  first_name = Faker::Name.unique.first_name
  user.first_name = first_name
  user.last_name = Faker::Name.unique.last_name
  user.email = Faker::Internet.unique.safe_email(first_name)
  user.save
end

5.times do
  category = Category.new
  category.name = Faker::Beer.style
  category.save
end

10.times do
  user = User.all.sample
  category = Category.all.sample
	article = Article.new
	article.user = user
  article.category = category
  article.title = Faker::Beer.name
  article.content = Faker::GreekPhilosophers.quote
	article.save
end

15.times do
  comment = Comment.new
  comment.content = Faker::Lovecraft.paragraph
  comment.user = User.all.sample
  comment.article = Article.all.sample
  comment.save
end
