# 1. Cleaning database
puts "Cleaning database..."
Favorite.destroy_all
EventGenre.destroy_all
Genre.destroy_all
Event.destroy_all
Venue.destroy_all
User.destroy_all

# 2. Create Users
puts "Creating users..."
users = User.create!([
  { name: 'Alice', email: 'alice@gmail.com', password: 'alice123' },
  { name: 'Renato', email: 'renato@hotmail.com', password: 'renato456' },
  { name: 'Admin', email: 'admin@admin.com', password: 'admin123' },
  { name: 'Maria', email: 'maria@gmail.com', password: 'maria789' },
  { name: 'João', email: 'joao@hotmail.com', password: 'joao123' },
  { name: 'Ana', email: 'ana@gmail.com', password: 'ana456' },
  { name: 'Pedro', email: 'pedro@hotmail.com', password: 'pedro789' },
  { name: 'Clara', email: 'clara@gmail.com', password: 'clara123' },
  { name: 'Lucas', email: 'lucas@hotmail.com', password: 'lucas456' },
  { name: 'Sofia', email: 'sofia@gmail.com', password: 'sofia789' },
  { name: 'Miguel', email: 'miguel@hotmail.com', password: 'miguel123' },
  { name: 'Julia', email: 'julia@gmail.com', password: 'julia456' },
  { name: 'Gabriel', email: 'gabriel@hotmail.com', password: 'gabriel789' }
])

# 3. Create Venues
puts "Creating venues..."
venues = [
  Venue.create!(name: 'Sala São Paulo', address: 'Praça Júlio Prestes, 16, São Paulo, SP, Brazil', latitude: -23.5341, longitude: -46.6392, capacity: 1498),
  Venue.create!(name: 'Blue Bird', address: 'R. Baluarte, 269, São Paulo, SP, Brazil', latitude: -23.5933, longitude: -46.6840, capacity: 500),
  Venue.create!(name: 'Teatro Municipal', address: 'Praça Ramos de Azevedo, São Paulo, SP, Brazil', latitude: -23.5454, longitude: -46.6388, capacity: 1523),
  Venue.create!(name: 'Audio Club', address: 'Av. Francisco Matarazzo, 694, São Paulo, SP, Brazil', latitude: -23.5278, longitude: -46.6693, capacity: 3000),
  Venue.create!(name: 'Teatro Bradesco', address: 'Rua Palestra Itália, 500, São Paulo, SP, Brazil', latitude: -23.5267, longitude: -46.6792, capacity: 1457),
  Venue.create!(name: 'Theatro São Pedro', address: 'Rua Albuquerque Lins, 207, São Paulo, SP, Brazil', latitude: -23.5332, longitude: -46.6576, capacity: 636),
  Venue.create!(name: 'Casa de Shows Santana', address: 'Rua Voluntários da Pátria, 2368, São Paulo, SP, Brazil', latitude: -23.5025, longitude: -46.6269, capacity: 800),
  Venue.create!(name: 'Tom Brasil', address: 'Rua Bragança Paulista, 1281, São Paulo, SP, Brazil', latitude: -23.6314, longitude: -46.7016, capacity: 1800),
  Venue.create!(name: 'Cultura Artística', address: 'Rua Nestor Pestana, 196, São Paulo, SP, Brazil', latitude: -23.5429, longitude: -46.6464, capacity: 1156),
  Venue.create!(name: 'Centro Cultural São Paulo', address: 'Rua Vergueiro, 1000, São Paulo, SP, Brazil', latitude: -23.5714, longitude: -46.6398, capacity: 321),
  Venue.create!(name: 'Cine Joia', address: 'Praça Carlos Gomes, 82, São Paulo, SP, Brazil', latitude: -23.5504, longitude: -46.6392, capacity: 600),
  Venue.create!(name: 'Lions Nightclub', address: 'Av. Brigadeiro Luís Antônio, 277, São Paulo, SP, Brazil', latitude: -23.5495, longitude: -46.6384, capacity: 1000)
]

# 4. Create Events with url_image
puts "Creating events..."
events = [
  Event.create!(title: 'Beethoven Symphony Night', description: 'A night of classical music featuring Beethoven\'s best works.', venue: venues[0], price: 200.0, start_date: '2024-12-15', start_time: '19:00', end_date: '2024-12-15', end_time: '22:00', url_image: 'https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  Event.create!(title: 'Jazz Evenings with John Doe Quartet', description: 'Experience the smooth sounds of jazz in an intimate setting.', venue: venues[1], price: 150.0, start_date: '2024-12-20', start_time: '20:00', end_date: '2024-12-20', end_time: '23:00', url_image: 'https://images.pexels.com/photos/733767/pexels-photo-733767.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  Event.create!(title: 'Opera Night: Carmen', description: 'Experience Bizet\'s masterpiece in a stunning production.', venue: venues[2], price: 350.0, start_date: '2024-12-18', start_time: '20:00', end_date: '2024-12-18', end_time: '23:30', url_image: 'https://images.pexels.com/photos/36474/dresden-semper-opera-house-historically-at-night.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  Event.create!(title: 'Electronic Music Festival', description: 'A night of electronic music featuring top DJs.', venue: venues[3], price: 180.0, start_date: '2024-12-22', start_time: '22:00', end_date: '2024-12-23', end_time: '06:00', url_image: 'https://images.pexels.com/photos/3253686/pexels-photo-3253686.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'MPB Live Show', description: 'The best of Brazilian Popular Music live.', venue: venues[4], price: 120.0, start_date: '2024-12-25', start_time: '21:00', end_date: '2024-12-26', end_time: '01:00', url_image: 'https://images.pexels.com/photos/2118045/pexels-photo-2118045.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'Chamber Orchestra Concert', description: 'An intimate evening of chamber music.', venue: venues[5], price: 150.0, start_date: '2024-12-28', start_time: '20:00', end_date: '2024-12-28', end_time: '22:30', url_image: 'https://images.pexels.com/photos/4028878/pexels-photo-4028878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  Event.create!(title: 'Rock in SP', description: 'A festival of rock bands from São Paulo.', venue: venues[6], price: 90.0, start_date: '2024-12-30', start_time: '18:00', end_date: '2024-12-31', end_time: '02:00', url_image: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'Samba Night', description: 'Traditional samba night with live band.', venue: venues[7], price: 80.0, start_date: '2025-01-05', start_time: '21:00', end_date: '2025-01-06', end_time: '04:00', url_image: 'https://images.pexels.com/photos/3801118/pexels-photo-3801118.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'Piano Masters', description: 'Classical piano recital by renowned pianists.', venue: venues[8], price: 200.0, start_date: '2025-01-10', start_time: '20:00', end_date: '2025-01-10', end_time: '22:30', url_image: 'https://images.pexels.com/photos/586415/pexels-photo-586415.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'World Music Festival', description: 'Celebrating diverse musical traditions.', venue: venues[9], price: 70.0, start_date: '2025-01-15', start_time: '16:00', end_date: '2025-01-15', end_time: '22:00', url_image: 'https://images.pexels.com/photos/1537637/pexels-photo-1537637.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'Alternative Rock Night', description: 'An evening of alternative rock music.', venue: venues[10], price: 100.0, start_date: '2025-01-20', start_time: '19:00', end_date: '2025-01-20', end_time: '23:00', url_image: 'https://images.pexels.com/photos/1647166/pexels-photo-1647166.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'Electronic Dance Party', description: 'A high-energy night of electronic dance music.', venue: venues[11], price: 90.0, start_date: '2025-01-25', start_time: '22:00', end_date: '2025-01-26', end_time: '04:00', url_image: 'https://images.pexels.com/photos/2820891/pexels-photo-2820891.jpeg?auto=compress&cs=tinysrgb&w=600')
]

# 5. Create Genres
puts "Creating genres..."
genres = Genre.create!([
  { name: 'Rock' },
  { name: 'Classical' },
  { name: 'Blues' },
  { name: 'Jazz' },
  { name: 'Electronic' },
  { name: 'MPB' },
  { name: 'Samba' },
  { name: 'Alternative' },
  { name: 'World Music' },
  { name: 'Opera' },
  { name: 'Chamber Music' },
  { name: 'Piano' },
  { name: 'DJ' },
  { name: 'Festival' }
])

# 6. Associate Events with Genres
puts "Associating events with genres..."

# Hash com eventos e gêneros
event_genre_map = {
  'Beethoven Symphony Night' => ['Classical'],
  'Jazz Evenings with John Doe Quartet' => ['Jazz'],
  'Opera Night: Carmen' => ['Opera', 'Classical'],
  'Electronic Music Festival' => ['Electronic', 'Festival', 'DJ'],
  'MPB Live Show' => ['MPB'],
  'Chamber Orchestra Concert' => ['Classical', 'Chamber Music'],
  'Rock in SP' => ['Rock', 'Festival'],
  'Samba Night' => ['Samba'],
  'Piano Masters' => ['Classical', 'Piano'],
  'World Music Festival' => ['World Music', 'Festival'],
  'Alternative Rock Night' => ['Rock', 'Alternative'],
  'Electronic Dance Party' => ['Electronic', 'DJ']
}

# Loop pelos eventos
event_genre_map.each do |event_title, genre_names|
  # Encontrar o evento pelo título
  event = events.find { |e| e.title == event_title }

  if event.nil?
    puts "Warning: Event '#{event_title}' not found. Skipping."
    next
  end

  # Loop pelos gêneros associados
  genre_names.each do |genre_name|
    genre = genres.find { |g| g.name == genre_name }

    if genre.nil?
      puts "Warning: Genre '#{genre_name}' not found for event '#{event_title}'. Skipping."
      next
    end

    # Criar a associação entre evento e gênero
    EventGenre.create!(event: event, genre: genre)
  end
end

puts "Finished associating events with genres."

# 7. Add Favorites
puts "Adding favorites..."
# Each user gets 2 random favorite events
users.each do |user|
  events.sample(2).each do |event|
    Favorite.create!(user: user, event: event)
  end
end

puts "Database seeding completed!"