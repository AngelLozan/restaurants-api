require "faker"
require 'securerandom'

puts "deleting existing data"
Comment.destroy_all
Restaurant.destroy_all
User.destroy_all
puts "done deleting existing data"

puts "creating ten users, and ten restaurants... Also creating comments"

restaurants = []
comments = []
users = []

10.times do
  users << User.create!(email: Faker::Internet.email, password: "secret", password_confirmation: "secret", authentication_token: SecureRandom.hex(10))
  puts "created a user"
end
puts "done creating users, now creating restaurants"

users.each do |user|
  restaurants << Restaurant.create!(name: Faker::Internet.email, address: Faker::Address.street_address, user_id: user.id)
  puts "created a restaurant"
end

puts "done creating restaurants, now creating comments"

restaurants.each do |restaurant|
  comments << Comment.create!(content: Faker::Lorem.paragraph, restaurant_id: restaurant.id, user_id: restaurant.user_id)
  puts "created a comment"
end

puts "Added comments to restaurants, and restaurants to users. Done seeding!"
