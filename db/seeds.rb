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
  Venue.create!(name: 'Auditório Ibirapuera', address: 'Av. Pedro Álvares Cabral, 0, Parque Ibirapuera, São Paulo, SP, Brasil', latitude: -23.6015, longitude: -46.6571, capacity: 800),
  Venue.create!(name: 'Espaço das Américas', address: 'Rua Tagipuru, 795, Barra Funda, São Paulo, SP, Brasil', latitude: -23.5275, longitude: -46.6646, capacity: 8000),
  Venue.create!(name: 'Allianz Parque', address: 'Av. Francisco Matarazzo, 1705, Água Branca, São Paulo, SP, Brasil', latitude: -23.5272, longitude: -46.6782, capacity: 55000),
  Venue.create!(name: 'Cine Joia', address: 'Praça Carlos Gomes, 82, Liberdade, São Paulo, SP, Brasil', latitude: -23.5541, longitude: -46.6354, capacity: 992),
  Venue.create!(name: 'Blue Note São Paulo', address: 'Av. Paulista, 2073, Bela Vista, São Paulo, SP, Brasil', latitude: -23.5614, longitude: -46.6560, capacity: 300),
  Venue.create!(name: 'Audio', address: 'Av. Francisco Matarazzo, 694, Água Branca, São Paulo, SP, Brasil', latitude: -23.5270, longitude: -46.6778, capacity: 3200),
  Venue.create!(name: 'SESC Pompeia', address: 'Rua Clélia, 93, Pompeia, São Paulo, SP, Brasil', latitude: -23.5265, longitude: -46.6872, capacity: 800),
  Venue.create!(name: 'Casa de Francisca', address: 'Rua Quintino Bocaiúva, 22, Sé, São Paulo, SP, Brasil', latitude: -23.5499, longitude: -46.6342, capacity: 150),
  Venue.create!(name: 'Teatro Bradesco', address: 'Rua Palestra Itália, 500, Perdizes, São Paulo, SP, Brasil', latitude: -23.5278, longitude: -46.6789, capacity: 1457),
  Venue.create!(name: 'Credicard Hall', address: 'Av. das Nações Unidas, 17955, Santo Amaro, São Paulo, SP, Brasil', latitude: -23.6515, longitude: -46.7042, capacity: 7000),
  Venue.create!(name: 'Carioca Club', address: 'Rua Cardeal Arcoverde, 2899, Pinheiros, São Paulo, SP, Brasil', latitude: -23.5619, longitude: -46.6944, capacity: 1000),
  Venue.create!(name: 'Tokio Marine Hall', address: 'Rua Bragança Paulista, 1281, Chácara Santo Antônio, São Paulo, SP, Brasil', latitude: -23.6466, longitude: -46.7100, capacity: 4000),
  Venue.create!(name: 'The Week', address: 'Rua Guaicurus, 324, Lapa, São Paulo, SP, Brasil', latitude: -23.5208, longitude: -46.6813, capacity: 2000),
  Venue.create!(name: 'Manifesto Bar', address: 'Rua Iguatemi, 36, Itaim Bibi, São Paulo, SP, Brasil', latitude: -23.5813, longitude: -46.6768, capacity: 300),
  Venue.create!(name: 'Bar Opinião', address: 'Rua Augusta, 2203, Consolação, São Paulo, SP, Brasil', latitude: -23.5537, longitude: -46.6564, capacity: 400),
  Venue.create!(name: 'Teatro Renault', address: 'Av. Brigadeiro Luís Antônio, 411, Bela Vista, São Paulo, SP, Brasil', latitude: -23.5534, longitude: -46.6438, capacity: 1500),
  Venue.create!(name: 'Bourbon Street Music Club', address: 'Rua dos Chanés, 127, Moema, São Paulo, SP, Brasil', latitude: -23.6095, longitude: -46.6604, capacity: 500),
  Venue.create!(name: 'Fabrique Club', address: 'Rua Barra Funda, 1071, Barra Funda, São Paulo, SP, Brasil', latitude: -23.5270, longitude: -46.6619, capacity: 800),
  Venue.create!(name: 'Clash Club', address: 'Rua Barra Funda, 969, Barra Funda, São Paulo, SP, Brasil', latitude: -23.5271, longitude: -46.6616, capacity: 500),
  Venue.create!(name: 'Bar Brahma', address: 'Av. São João, 677, Centro Histórico, São Paulo, SP, Brasil', latitude: -23.5429, longitude: -46.6395, capacity: 200),
  Venue.create!(name: 'Casa Natura Musical', address: 'Rua Artur de Azevedo, 2134, Pinheiros, São Paulo, SP, Brasil', latitude: -23.5618, longitude: -46.6838, capacity: 710),
  Venue.create!(name: 'SESC Vila Mariana', address: 'Rua Pelotas, 141, Vila Mariana, São Paulo, SP, Brasil', latitude: -23.5908, longitude: -46.6362, capacity: 609),
  Venue.create!(name: 'Estádio MorumBis', address: 'Praça Roberto Gomes Pedrosa, 1, Morumbi, São Paulo, SP, Brasil', latitude: -23.5981, longitude: -46.7187, capacity: 72000),
  Venue.create!(name: 'Eazy Club', address: 'Av. Marquês de São Vicente, 1767, Barra Funda, São Paulo, SP, Brasil', latitude: -23.5182, longitude: -46.6736, capacity: 2500),
  Venue.create!(name: 'Arena Anhembi', address: 'Av. Olavo Fontoura, 1209, Santana, São Paulo, SP, Brasil', latitude: -23.5083, longitude: -46.6308, capacity: 30000),
  Venue.create!(name: 'Centro Cultural São Paulo', address: 'Rua Vergueiro, 1000, Paraíso, São Paulo, SP, Brasil', latitude: -23.5700, longitude: -46.6383, capacity: 622),
  Venue.create!(name: 'Teatro Gazeta', address: 'Av. Paulista, 900, Bela Vista, São Paulo, SP, Brasil', latitude: -23.5631, longitude: -46.6541, capacity: 700),
  Venue.create!(name: 'Via Matarazzo', address: 'Av. Francisco Matarazzo, 764, Água Branca, São Paulo, SP, Brasil', latitude: -23.5270, longitude: -46.6778, capacity: 2000),
  Venue.create!(name: 'Rosas de Ouro', address: 'Rua Cel. Euclides Machado, 1066, Limão, São Paulo, SP, Brasil', latitude: -23.5035, longitude: -46.6749, capacity: 1000),
  Venue.create!(name: 'Tokyo São Paulo', address: 'Rua Major Sertório, 110, República, São Paulo, SP, Brasil', latitude: -23.5475, longitude: -46.6464, capacity: 400)
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
  { name: 'Ópera' },
  { name: 'Música de Câmara' },
  { name: 'Piano' },
  { name: 'DJ' },
  { name: 'Festival' },
  { name: 'Estádio' },
  { name: 'Pop' },
  { name: 'Reggae' },
  { name: 'Rap' },
  { name: 'Hip-Hop' },
  { name: 'Funk' },
  { name: 'Forró' },
  { name: 'Pagode' },
  { name: 'Axé' },
  { name: 'Heavy Metal' },
  { name: 'Hard Rock' },
  { name: 'Soul' },
  { name: 'R&B' },
  { name: 'Gospel' },
  { name: 'Trap' },
  { name: 'Sertanejo' },
  { name: 'Country' }
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
  'Noite de Rock Alternativo' => ['Alternativa'],
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
