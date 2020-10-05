# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Beginning seed process, 10 restaurants'
Restaurant.destroy_all

10.times do
  @restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )
  5.times do
    @review = Review.create(
      content: Faker::TvShows::RickAndMorty.quote,
      rating: rand(6),
      restaurant_id: @restaurant.id
    )
  end
end

puts 'Ending seed process, Nico sucks'
