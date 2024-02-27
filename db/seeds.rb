require 'faker'

NUM_OF_USERS = 10
NUM_OF_ARTICLES = 30
VALID_STATUSES = %w[public private archived].freeze
ADMIN_PASSWORD = 'Password@123!'.freeze

def clear_existing_data
  puts "Destroy #{User.count} users..."
  User.destroy_all

  puts "Destroying #{Article.count} articles..."
  Article.destroy_all

  puts "Destroying #{Like.count} likes..."
  Like.destroy_all
end

def create_admin_user
  puts 'Creating admin user...'

  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: ADMIN_PASSWORD
  )
end

def create_users
  puts "Creating #{NUM_OF_USERS} users..."

  NUM_OF_USERS.times do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 10, max_length: 15, mix_case: true, special_characters: true)
    )
  end
end

def create_articles
  puts "Creating #{NUM_OF_ARTICLES} articles..."

  NUM_OF_ARTICLES.times do
    Article.create!(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph_by_chars(number: Faker::Number.between(from: 500, to: 5000), supplemental: false),
      user: User.order('RANDOM()').limit(1).first,
      status: VALID_STATUSES.sample
    )
  end
end

clear_existing_data
create_users
admin_user = create_admin_user
create_articles

puts 'Done...'
puts ''
puts 'Login details:'
puts '------------------------'
puts "email: #{admin_user.email}"
puts "password: #{ADMIN_PASSWORD}"
puts '========================'
