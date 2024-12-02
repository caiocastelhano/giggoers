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
#1.Clean the database
puts "Cleaning database..."
User.destroy_all
Venue.destroy_all
Event.destroy_all

#2.Creating the instances
# Create Users
User.create([
  { name: 'Alice', email: 'alice@gmail.com', password: 'alice123' },
  { name: 'Renato', email: 'renato@hotmail.com', password: 'renato456' }
])

# Create Venues
sala_sao_paulo = Venue.create(
  name: 'Sala São Paulo',
  address: 'Praça Júlio Prestes, 16, São Paulo, SP, Brazil',
  latitude: -23.5341,
  longitude: -46.6392,
  capacity: 1498
)

blue_bird = Venue.create(
  name: 'Blue Bird',
  address: 'R. Baluarte, 269, São Paulo, SP, Brazil',
  latitude: -23.5933,
  longitude: -46.6840,
  capacity: 500
)

# Create Events
Event.create([
  {
    title: 'Beethoven Symphony Night',
    description: 'A night of classical music featuring Beethoven’s best works.',
    type: 'Classical Music',
    venue: sala_sao_paulo,
    price: 200.0,
    start_date: '2024-12-15 19:00',
    end_date: '2024-12-15 22:00'
  },
  {
    title: 'Jazz Evenings with John Doe Quartet',
    description: 'Experience the smooth sounds of jazz in an intimate setting.',
    type: 'Jazz',
    venue: blue_bird,
    price: 150.0,
    start_date: '2024-12-20 20:00',
    end_date: '2024-12-20 23:00'
  },
  {
    title: 'New Year’s Eve Gala',
    description: 'Ring in the New Year with an exclusive gala at Sala São Paulo.',
    type: 'Gala',
    venue: sala_sao_paulo,
    price: 500.0,
    start_date: '2024-12-31 21:00',
    end_date: '2025-01-01 01:00'
  },
  {
    title: 'Indie Rock Night',
    description: 'A night of indie rock performances from top local bands.',
    type: 'Rock',
    venue: blue_bird,
    price: 100.0,
    start_date: '2024-12-10 19:30',
    end_date: '2024-12-10 22:30'
  }
])

# Create Genres
rock = Genre.create(name: rock)
classical = Genre.create(name: classical)
blues = Genre.create(name: blues)
jazz = Genre.create(name: jazz)

# Add Favorites
Favorite.create(user_id: 1, event_id: 1)
Favorite.create(user_id: 2, event_id: 2)
