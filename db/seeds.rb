# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy #{User.count} users..."
User.destroy_all

puts 'Creating test user...'
User.create!(first_name: 'Glenn', last_name: 'Tippett', email: 'test@email.com', password: 'Password@123!')

puts "Destroying #{Article.count} articles..."
Article.destroy_all

puts 'Creating article...'
Article.create!(title: 'Cool article', body: 'Body of the cool article', user: User.first, status: 'public')
