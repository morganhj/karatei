# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Deleting all sources"
Source.delete_all
puts "Deleting all collections"
Collection.delete_all
puts "Deleting all users"
User.where.not(email: ["jusanab@gmail.com","hoaremorgan@gmail.com"]).delete_all


morgan = User.create!(nickname: "morgan", email: "morgan@karatei.com", password: "testtest", list: List.create!())
juan = User.create!(nickname: "juan", email: "juan@karatei.com", password: "testtest", list: List.create!())

User.all.each do |user|
	5.times do
		collection = Collection.create!(user: user, title: Faker::Book.genre, percentage: rand(0..100))
		5.times do
			source = Source.create!(collection: collection, title: Faker::TvShows::Friends.quote.split('.')[0], url: Faker::Internet.url)
		end
	end
end