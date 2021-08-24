# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Product.destroy_all
User.destroy_all

puts 'creating products...'

10.times do |i|
  products = Product.create!(
    name: Faker::Company.name,
    tagline: Faker::Company.catch_phrase
  )

  puts "#{i + 1} - #{products.name}: #{products.tagline}"
end

puts 'done!'
