nb_cities = 10
nb_users = 20
nb_listings = 50
nb_past_reservations = 5
nb_future_reservations = 5


User.destroy_all
City.destroy_all
Listing.destroy_all
Reservation.destroy_all

Faker::Config.locale = 'fr'

cities_array = []
while cities_array.length < nb_cities
  city = Faker::Address.city
  cities_array << city unless cities_array.include?(city)
end
cities_array.each do |city|
  City.create(
    name: city,
    zip_code: Faker::Address.zip_code
    )
end

puts "#{nb_cities} villes ont été crées."

nb_users.times do |i|
  User.create(
    email: Faker::Internet.email,
    phone_number: Faker::Number.leading_zero_number(digits: 10),
    description: Faker::Lorem.sentence
    )
end
  
puts "#{nb_users} users ont été crées"

nb_listings.times do
  l=Listing.create(
    available_beds: rand(1..8),
    price: rand(20..850),
    description: Faker::Lorem.sentence(word_count: 40),
    has_wifi: Faker::Boolean.boolean(true_ratio: 0.5),
    welcome_message: Faker::ChuckNorris.fact,
    user: User.all.sample,
    city: City.all.sample
    )
  puts l
end

puts "#{nb_listings} listings ont été crées"

nb_past_reservations.times do
  start_time = Faker::Time.backward(days: 365)
  Reservation.create!(
    start_date: start_time,
    end_date: start_time + rand(3600..2678800), 
    user: User.all.sample,
    listing: Listing.all.sample
  )
end

puts "#{nb_past_reservations} réservations passées ont été crées"

nb_future_reservations.times do
  start_time = Faker::Time.forward(days: 5)
  Reservation.create!(
    start_date: start_time,
    end_date: start_time + rand(3600..2678800),
    user: User.all.sample,
    listing: Listing.all.sample
  )
end

puts "#{nb_future_reservations} réservations futures ont été crées"

2.times do
  Listing.create!(
    available_beds: rand(1..8),
    price: rand(20..850),
    description: Faker::Lorem.sentence(word_count: 40),
    has_wifi: Faker::Boolean.boolean(true_ratio: 0.5),
    welcome_message: Faker::ChuckNorris.fact,
    user: User.all.sample,
    city: City.all.sample
    )
end
