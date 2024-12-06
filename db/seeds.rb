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
  { name: 'Admin', email: 'admin@admin.com', password: 'admin123' },
  { name: 'Caio', email: 'caio@gmail.com', password: 'caio1234' },
  { name: 'Virginie', email: 'virginie@gmail.com', password: 'virginie123' }
])

# 3. Create Venues
#puts "Creating venues..."
venues = [
  Venue.create!(name: 'Sala São Paulo', address: 'Praça Júlio Prestes, 16, São Paulo, SP, Brasil', latitude: -23.5341, longitude: -46.6392, capacity: 1498),
  Venue.create!(name: 'Blue Bird', address: 'R. Baluarte, 269, São Paulo, SP, Brasil', latitude: -23.5933, longitude: -46.6840, capacity: 500),
  Venue.create!(name: 'Teatro Municipal', address: 'Praça Ramos de Azevedo, São Paulo, SP, Brasil', latitude: -23.5454, longitude: -46.6388, capacity: 1523),
  Venue.create!(name: 'Audio Club', address: 'Av. Francisco Matarazzo, 694, São Paulo, SP, Brasil', latitude: -23.5278, longitude: -46.6693, capacity: 3000),
  Venue.create!(name: 'Teatro Bradesco', address: 'Rua Palestra Itália, 500, São Paulo, SP, Brasil', latitude: -23.5267, longitude: -46.6792, capacity: 1457),
  Venue.create!(name: 'Theatro São Pedro', address: 'Rua Albuquerque Lins, 207, São Paulo, SP, Brasil', latitude: -23.5332, longitude: -46.6576, capacity: 636),
  Venue.create!(name: 'Casa de Shows Santana', address: 'Rua Voluntários da Pátria, 2368, São Paulo, SP, Brasil', latitude: -23.5025, longitude: -46.6269, capacity: 800),
  Venue.create!(name: 'Tom Brasil', address: 'Rua Bragança Paulista, 1281, São Paulo, SP, Brasil', latitude: -23.6314, longitude: -46.7016, capacity: 1800),
  Venue.create!(name: 'Cultura Artística', address: 'Rua Nestor Pestana, 196, São Paulo, SP, Brasil', latitude: -23.5429, longitude: -46.6464, capacity: 1156),
  Venue.create!(name: 'Centro Cultural São Paulo', address: 'Rua Vergueiro, 1000, São Paulo, SP, Brasil', latitude: -23.5714, longitude: -46.6398, capacity: 321),
  Venue.create!(name: 'Cine Joia', address: 'Praça Carlos Gomes, 82, São Paulo, SP, Brasil', latitude: -23.5504, longitude: -46.6392, capacity: 600),
  Venue.create!(name: 'Lions Nightclub', address: 'Av. Brigadeiro Luís Antônio, 277, São Paulo, SP, Brasil', latitude: -23.5495, longitude: -46.6384, capacity: 1000)
]

# 4. Create Events with url_image
puts "Creating events..."
events = [
  Event.create!(title: 'Noite da Sinfonia de Beethoven', description: 'Uma noite de música clássica com as melhores obras de Beethoven.', venue: venues[0], price: 200.0, start_date: '15-12-2024', start_time: '19:00', end_date: '15-12-2024', end_time: '22:00', url_image: 'https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', purchase_link:'#'),
  Event.create!(title: 'Noites de Jazz com John Doe Quartet', description: 'Experimente o som suave do jazz em um ambiente íntimo.', venue: venues[1], price: 150.0, start_date: '20-12-2024', start_time: '20:00', end_date: '20-12-2024', end_time: '23:00', url_image: 'https://images.pexels.com/photos/733767/pexels-photo-733767.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', purchase_link:'#'),
  Event.create!(title: 'Noite de Ópera: Carmen', description: 'Experimente a obra-prima de Bizet em uma produção deslumbrante.', venue: venues[2], price: 350.0, start_date: '18-12-2024', start_time: '20:00', end_date: '18-12-2024', end_time: '23:30', url_image: 'https://images.pexels.com/photos/36474/dresden-semper-opera-house-historically-at-night.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', purchase_link:'#'),
  Event.create!(title: 'Festival de Música Eletrônica', description: 'Uma noite de música eletrônica com os melhores DJs.', venue: venues[3], price: 180.0, start_date: '01-07-2025', start_time: '22:00', end_date: '02-07-2025', end_time: '06:00', url_image: 'https://images.pexels.com/photos/3253686/pexels-photo-3253686.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Event.create!(title: 'Show Ao Vivo de MPB', description: 'O melhor da Música Popular Brasileira ao vivo.', venue: venues[4], price: 120.0, start_date: '25-02-2024', start_time: '21:00', end_date: '26-02-2025', end_time: '01:00', url_image: 'https://images.pexels.com/photos/2118045/pexels-photo-2118045.jpeg?auto=compress&cs=tinysrgb&w=600', purchase_link:'#'),
  Event.create!(title: 'Concerto de Orquestra de Câmara', description: 'Uma noite intimista de música de câmara.', venue: venues[5], price: 150.0, start_date: '28-12-2024', start_time: '20:00', end_date: '28-12-2024', end_time: '22:30', url_image: 'https://images.pexels.com/photos/4028878/pexels-photo-4028878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', purchase_link:'#'),
  Event.create!(title: 'Caetano & Bethânia', description: 'Últimos shows desta turnê histórica.', venue: venues[6], price: 90.0, start_date: '14-12-2024', start_time: '20:30', end_date: '14-12-204', end_time: '23:00', url_image: 'https://veja.abril.com.br/wp-content/uploads/2024/03/GJI-NTPXwAAG0Sp.jpg?quality=70&strip=info&w=900&h=600&crop=1', purchase_link: 'https://www.ticketmaster.com.br/event/caetanoebethania'),
  Event.create!(title: 'Noite de Samba', description: 'Noite tradicional de samba com banda ao vivo.', venue: venues[7], price: 80.0, start_date: '05-01-2025', start_time: '21:00', end_date: '06-01-2025', end_time: '04:00', url_image: 'https://images.pexels.com/photos/3801118/pexels-photo-3801118.jpeg?auto=compress&cs=tinysrgb&w=600', purchase_link:'#'),
  Event.create!(title: 'Mestres do Piano', description: 'Recital de piano clássico com pianistas renomados.', venue: venues[8], price: 200.0, start_date: '10-01-2025', start_time: '20:00', end_date: '10-01-2025', end_time: '22:30', url_image: 'https://images.pexels.com/photos/586415/pexels-photo-586415.jpeg?auto=compress&cs=tinysrgb&w=600', purchase_link:'#'),
  Event.create!(title: 'Festival de Música do Mundo', description: 'Celebrando diversas tradições musicais.', venue: venues[9], price: 70.0, start_date: '15-03-2025', start_time: '16:00', end_date: '15-03-2025', end_time: '22:00', url_image: 'https://images.pexels.com/photos/1537637/pexels-photo-1537637.jpeg?auto=compress&cs=tinysrgb&w=600', purchase_link:'#'),
  Event.create!(title: 'Noite de Rock Alternativo', description: 'Uma noite de música rock alternativo.', venue: venues[10], price: 100.0, start_date: '20-02-2025', start_time: '19:00', end_date: '20-02-2025', end_time: '23:00', url_image: 'https://images.pexels.com/photos/1647166/pexels-photo-1647166.jpeg?auto=compress&cs=tinysrgb&w=600', purchase_link:'#')
]

# 5. Create Genres
puts "Creating genres..."
genres = Genre.create!([
  { name: 'Rock' },
  { name: 'Clássica' },
  { name: 'Blues' },
  { name: 'Jazz' },
  { name: 'Eletrônica' },
  { name: 'MPB' },
  { name: 'Samba' },
  { name: 'Alternativa' },
  { name: 'Música do Mundo' },
  { name: 'Ópera' },
  { name: 'Música de Câmara' },
  { name: 'Piano' },
  { name: 'DJ' },
  { name: 'Festival' },
  { name: 'Estádio' }
])

# 6. Associate Events with Genres
puts "Associando eventos com gêneros..."

# Hash com eventos e gêneros
event_genre_map = {
  'Noite da Sinfonia de Beethoven' => ['Clássica'],
  'Noites de Jazz com John Doe Quartet' => ['Jazz'],
  'Noite de Ópera: Carmen' => ['Ópera', 'Clássica'],
  'Festival de Música Eletrônica' => ['Eletrônica', 'Festival', 'DJ'],
  'Show Ao Vivo de MPB' => ['MPB'],
  'Concerto de Orquestra de Câmara' => ['Clássica', 'Música de Câmara'],
  'Caetano & Bethânia' => ['MPB', 'Estádio'],
  'Noite de Samba' => ['Samba'],
  'Mestres do Piano' => ['Clássica', 'Piano'],
  'Festival de Música do Mundo' => ['Música do Mundo', 'Festival'],
  'Noite de Rock Alternativo' => ['Rock', 'Alternativa'],
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

# 7. Add Favorites for Each User
puts "Adding consistent favorites for each user..."

# Define o evento "Caetano & Bethânia"
caetano_event = Event.find_by(title: 'Caetano & Bethânia')

# Adiciona os favoritos para cada usuário
users.each do |user|
  # Adiciona o evento fixo "Caetano & Bethânia" como favorito
  if caetano_event
    Favorite.find_or_create_by!(
      user: user,
      event: caetano_event,
      created_at: Date.today,
      updated_at: Date.today
    )
  else
    puts "Warning: Evento 'Caetano & Bethânia' não encontrado. Favorito não adicionado."
  end

  # Seleciona mais 4 eventos diferentes para completar os favoritos
  other_events = Event.where.not(id: caetano_event&.id).order(:id).limit(4)

  other_events.each_with_index do |event, index|
    favorite_date = Date.today - (index + 1).months

    Favorite.find_or_create_by!(
      user: user,
      event: event,
      created_at: favorite_date,
      updated_at: favorite_date
    )
  end
end

puts "Favorites added consistently!"

puts "Database seeding completed!"
