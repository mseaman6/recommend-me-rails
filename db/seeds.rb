# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:name => "Monica", :email => "mls@email.com", :password => "monimoni")
User.create(:name => "Danielle", :email => "dma@email.com", :password => "hi")
User.create(:name => "Skittles", :email => "skittles@email.com", :password => "tastetherainbow")
User.create(:name => "Matt", :email => "matt@email.com", :password => "poop")


Category.create(:name => "TV")
Category.create(:name => "MOVIE")
Category.create(:name => "RESTAURANT")
Category.create(:name => "ACTIVITY")
Category.create(:name => "BOOK")


Recommendation.create(:title => "Osteria Morini", :description => "Italian (southern)", :user_id => 2, :category_id => 3)
Recommendation.create(:title => "Acqua al 2", :description => "Italian (florentine); get the pasta and steak samplers", :user_id => 4, :category_id => 3)
Recommendation.create(:title => "Life in Pieces", :description => "netflix show, 30 min.; funny & cute", :user_id => 1, :category_id => 1)
Recommendation.create(:title => "Life is Beautiful", :description => "WWII flick, heartwarming and hearbreaking", :user_id => 2, :category_id => 2)
Recommendation.create(:title => "Glass Castle", :description => "biography, growing up with weird parents", :user_id => 1, :category_id => 5)


Comment.create(:text => "I don't want to read this!!!!", :user_id => 2, :recommendation_id => 5)
Comment.create(:text => "soooo yummmy", :user_id => 1, :recommendation_id => 2)
Comment.create(:text => "agreed", :user_id => 1, :recommendation_id => 4)
