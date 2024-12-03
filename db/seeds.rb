# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
## 1. Clean the database
puts "Cleaning database..."
Favorite.destroy_all
EventGenre.destroy_all
Genre.destroy_all
Event.destroy_all
Venue.destroy_all
User.destroy_all

# 2. Create Users
puts "Creating users..."
User.create!([
  { name: 'Alice', email: 'alice@gmail.com', password: 'alice123' },
  { name: 'Renato', email: 'renato@hotmail.com', password: 'renato456' }
])

# 3. Create Venues
puts "Creating venues..."
sala_sao_paulo = Venue.create!(
  name: 'Sala São Paulo',
  address: 'Praça Júlio Prestes, 16, São Paulo, SP, Brazil',
  latitude: -23.5341,
  longitude: -46.6392,
  capacity: 1498
)

blue_bird = Venue.create!(
  name: 'Blue Bird',
  address: 'R. Baluarte, 269, São Paulo, SP, Brazil',
  latitude: -23.5933,
  longitude: -46.6840,
  capacity: 500
)

# 4. Create Events
puts "Creating events..."
beethoven = Event.create!(
  title: 'Beethoven Symphony Night',
  description: 'A night of classical music featuring Beethoven\'s best works.',
  venue: sala_sao_paulo,
  price: 200.0,
  start_date: '2024-12-15',
  start_time: '19:00',
  end_date: '2024-12-15',
  end_time: '22:00'
)

jazz_evening = Event.create!(
  title: 'Jazz Evenings with John Doe Quartet',
  description: 'Experience the smooth sounds of jazz in an intimate setting.',
  venue: blue_bird,
  price: 150.0,
  start_date: '2024-12-20',
  start_time: '20:00',
  end_date: '2024-12-20',
  end_time: '23:00'
)

gala = Event.create!(
  title: 'New Year\'s Eve Gala',
  description: 'Ring in the New Year with an exclusive gala at Sala São Paulo.',
  venue: sala_sao_paulo,
  price: 500.0,
  start_date: '2024-12-31',
  start_time: '21:00',
  end_date: '2025-01-01',
  end_time: '01:00'
)

indie_rock = Event.create!(
  title: 'Indie Rock Night',
  description: 'A night of indie rock performances from top local bands.',
  venue: blue_bird,
  price: 100.0,
  start_date: '2024-12-10',
  start_time: '19:30',
  end_date: '2024-12-10',
  end_time: '22:30'
)

# 5. Create Genres
puts "Creating genres..."
rock = Genre.create!(name: 'Rock')
classical = Genre.create!(name: 'Classical')
blues = Genre.create!(name: 'Blues')
jazz = Genre.create!(name: 'Jazz')

# 6. Associate Events with Genres
puts "Associating events with genres..."
EventGenre.create!(event: beethoven, genre: classical)
EventGenre.create!(event: jazz_evening, genre: jazz)
EventGenre.create!(event: gala, genre: classical)
EventGenre.create!(event: indie_rock, genre: rock)

# 7. Add Favorites
puts "Adding favorites..."
Favorite.create!(user: User.first, event: beethoven)
Favorite.create!(user: User.last, event: jazz_evening)

puts "Database seeding completed!"
