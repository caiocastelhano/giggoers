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
  { name: 'Virginie', email: 'virginie@gmail.com', password: 'virginie123' },
  { name: 'Máira Senna', email: 'maira@gmail.com', password: 'maira123' }
])

# 3. Create Venues
#puts "Creating venues..."
venues = [
  Venue.create!(name: 'Auditório Ibirapuera', address: 'Av. Pedro Álvares Cabral, 0, Parque Ibirapuera, São Paulo, SP, Brasil', latitude: -23.6015, longitude: -46.6571, capacity: 800),
  Venue.create!(name: 'Espaço Unimed', address: 'Rua Tagipuru, 795, Barra Funda, São Paulo, SP, Brasil', latitude: -23.5275, longitude: -46.6646, capacity: 8000),
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
Event.create!(title: 'C6 Fest', description: 'Amaro Freitas Septeto, Arooj Aftab, Mulatu Astatke, Brian Blade & The Fellowship Band, Kassa Overall e Meshell Ndegeocello.', venue: venues[0], price: 448.00, start_date: '22-05-2025', start_time: '19:00', end_date: '23-05-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934427/c6-fest-festival-2025-data-foto-divulgacao_widelg_n3ghas.jpg', purchase_link:'https://c6fest.byinti.com/#/event/c6fest-2025-auditorio-64-469'),
Event.create!(title: 'Ney Matogrosso', description: 'Show da turnê Bloco na Rua.', venue: venues[1], price: 260.00, start_date: '07-02-2025', start_time: '20:00', end_date: '07-02-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934436/ney_qt0c9h.jpg', purchase_link:'https://www.ticket360.com.br/evento/29723/ingressos-para-ney-matogrosso-bloco-na-rua'),
Event.create!(title: 'Oswaldo Montenegro', description: 'Celebrando 50 anos de estrada!', venue: venues[1], price: 320.00, start_date: '25-01-2025', start_time: '19:00', end_date: '25-01-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934437/oswaldo_lqmvy0.png', purchase_link:'https://www.ticket360.com.br/evento/29777/ingressos-para-oswaldo-montenegro-celebrando-50-anos-de-estrada'),
Event.create!(title: 'Ana Castela', description: 'Uma noite com a nova estrela da música sertaneja.', venue: venues[1], price: 200.00, start_date: '21-12-2024', start_time: '22:00', end_date: '21-12-2024', end_time: '23:30', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934428/castela_uuq5cb.webp', purchase_link:'https://www.ticket360.com.br/evento/29594/ingressos-para-ana-castela'),
Event.create!(title: 'Alcione', description: 'Show de 50 anos de carreira.', venue: venues[1], price: 210.00, start_date: '22-03-2025', start_time: '19:00', end_date: '22-03-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934421/alcione_wpswpv.png', purchase_link:'https://www.ticket360.com.br/evento/29836/ingressos-para-alcione'),
Event.create!(title: 'Chris Brown', description: 'Após passar com a tour 11:11 pelos Estados Unidos, pelo Canadá e pela Europa, cantor chega ao Brasil com uma performance diferente do que vinha apresentando.', venue: venues[2], price: 480.00, start_date: '22-12-2024', start_time: '20:30', end_date: '22-12-2024', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934429/chris_brown_vna5aa.webp', purchase_link:'https://www.ticketmaster.com.br/event/chris-brown-extra'),
Event.create!(title: 'Caetano & Bethânia', description: 'O repertório passa por diferentes momentos da trajetória de cada um, mas também inclui canções dos Doces Bárbaros.', venue: venues[2], price: 230.00, start_date: '18-12-2024', start_time: '20:30', end_date: '18-12-2024', end_time: '22:30', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934429/caetano_taixal.jpg', purchase_link:'https://www.ticketmaster.com.br/event/caetano-e-bethania-venda-geral-sao-paulo-dia-3'),
Event.create!(title: 'Amyl & The Sniffers', description: 'A banda é conhecida por sua energia no palco e som punk explosivo.', venue: venues[3], price: 290.00, start_date: '06-03-2025', start_time: '19:00', end_date: '06-03-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934423/amyl_d7b0hs.jpg', purchase_link:'https://www.eventim.com.br/artist/amyl-and-the-sniffers'),
Event.create!(title: 'Francisco, El Hombre', description: 'Banda anuncia um hiato, ou “siesta criativa”, após a última turnê e o álbum “HASTA EL FINAL“, um “até logo” aos fãs.', venue: venues[3], price: 120.00, start_date: '05-04-2025', start_time: '22:00', end_date: '05-04-2025', end_time: '23:30', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934430/feh_wkzfvv.jpg', purchase_link:'https://cinejoia.byinti.com/#/event/feh'),
Event.create!(title: 'Vapors of Morphine', description: 'O legado do Morphine continua vivo com a banda Vapors of Morphine, liderada pelo fundador Dana Colley.', venue: venues[3], price: 200.0, start_date: '14-02-2025', start_time: '21:00', end_date: '14-02-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934436/morphine_veotls.webp', purchase_link:'https://fastix.com.br/events/vapors-of-morphine'),
Event.create!(title: 'Mudhoney', description: 'Uma das maiores bandas ao vivo das últimas quatro décadas, mesclando punk e rock de garagem em show intenso e empolgante.', venue: venues[3], price: 400.00, start_date: '21-03-2025', start_time: '20:00', end_date: '21-03-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934436/mud4_kbw0h5.jpg', purchase_link:'https://fastix.com.br/events/mudhoney'),
Event.create!(title: 'Tributo a Elton John', description: 'Com Mark Lambert.', venue: venues[4], price: 140.00, start_date: '16-01-2025', start_time: '20:00', end_date: '16-01-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934430/eltonjohn_dbak0v.jpg', purchase_link:'https://www.eventim.com.br/artist/blue-note-sp/tributo-a-elton-john-com-mark-lambert-3785016/'),
Event.create!(title: 'Lobão', description: 'Luau Indoor.', venue: venues[4], price: 190.00, start_date: '18-01-2025', start_time: '20:00', end_date: '18-01-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934434/Lobao-anuncia-sua-nova-turne_-50-Anos-de-Vi_ooau8d.jpg', purchase_link:'https://www.eventim.com.br/event/lobao-luau-indoor-blue-note-sao-paulo-19530372/'),
Event.create!(title: 'Ensaio Monobloco', description: 'Esquenta para o Carnaval 2025.', venue: venues[5], price: 70.00, start_date: '25-01-2025', start_time: '21:00', end_date: '25-01-2025', end_time: '23:30', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934435/monobloco_zbtetc.webp', purchase_link:'https://www.ticket360.com.br/ingressos/29980/ingressos-para-ensaio-monobloco'),
Event.create!(title: 'MartNália', description: 'Lançamento do álbum Pagode da MartNália.', venue: venues[5], price: 80.00, start_date: '01-02-2025', start_time: '21:00', end_date: '01-02-2025', end_time: '23:30', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934435/martnalia_wdgycq.webp', purchase_link:'https://www.ticket360.com.br/evento/30147/ingressos-para-martnalia-lancamento-do-album-pagode-da-martnalia'),
Event.create!(title: 'Duda Beat', description: 'Tara & Tour.', venue: venues[5], price: 70.00, start_date: '15-03-2025', start_time: '21:00', end_date: '15-03-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934429/duda_ke0m5t.webp', purchase_link:'https://www.ticket360.com.br/evento/30118/ingressos-para-duda-beat-tara-e-tour'),
Event.create!(title: 'Falamansa', description: 'Show de lançamento do álbum Universos.', venue: venues[5], price: 200.0, start_date: '14-03-2025', start_time: '21:00', end_date: '14-03-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934430/falmansa_cwycd6.webp', purchase_link:'https://www.ticket360.com.br/evento/30098/ingressos-para-falamansa-show-de-lancamento'),
Event.create!(title: 'Hermeto Pascoal e Big Band', description: 'Natureza Universal.', venue: venues[6], price: 70.00, start_date: '15-12-2024', start_time: '18:00', end_date: '15-12-2024', end_time: '20:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934431/hermeto_ho6x9c.png', purchase_link:'https://www.sescsp.org.br/programacao/hermeto-pascoal-e-big-ban/'),
Event.create!(title: 'Romulo Fróes canta Transa', description: 'Guilherme Held na guitarra, Marcelo Cabral no baixo, Décio 7 na bateria e percussão e Rodrigo Campos no cavaquinho.', venue: venues[7], price: 200.0, start_date: '19-12-2024', start_time: '20:30', end_date: '19-12-2024', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934437/romulo_qemuwh.jpg', purchase_link:'https://pixelticket.com.br/eventos/24382/romulo-froes-transa-porao-qui-19-12-abertura-porao-20h'),
Event.create!(title: 'Concerto de Natal por João Carlos Martins', description: 'Espetáculo natalino especialmente criado para a ocasião.', venue: venues[8], price: 17.50, start_date: '18-12-2024', start_time: '20:00', end_date: '18-12-2024', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934435/maestro_bbvdz5.jpg', purchase_link:'https://uhuu.com/comprar-ingressos/sp/sao-paulo/concerto-de-natal-por-joao-carlos-martins-13697#/'),
Event.create!(title: 'Lacuna Coil', description: 'Turnê do álbum Sleepless Empire.', venue: venues[10], price: 230.00, start_date: '15-03-2025', start_time: '19:00', end_date: '15-03-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934433/lacuna-coil-banda_f3kicz.webp', purchase_link:'https://www.clubedoingresso.com/evento/lacunacoil-saopaulo'),
Event.create!(title: 'Gessinger', description: 'Acústico: Engenheiros do Hawaii.', venue: venues[11], price: 280.00, start_date: '02-01-2025', start_time: '20:00', end_date: '02-01-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934433/Humberto-Gessinger-768x432_szd3iw.jpg', purchase_link:'https://www.tokiomarinehall.com.br/compre-seu-ingresso/?esid=3696704'),
Event.create!(title: 'Tarja e Marko Hietala', description: 'Living The Dream Together Tour 2025.', venue: venues[11], price: 300.00, start_date: '24-05-2025', start_time: '19:00', end_date: '24-05-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934437/Tarja-e-Marko-750x450_bx0pjl.jpg', purchase_link:'https://www.eventim.com.br/artist/tarja/'),
Event.create!(title: 'Jorge Vercillo', description: 'Show de comemoração de 30 anos de carreira.', venue: venues[11], price: 320.00, start_date: '25-04-2025', start_time: '19:00', end_date: '25-04-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934438/vercilo_uwkkrv.jpg', purchase_link:'https://www.ticketmaster.com.br/event/jorge-vercillo-tokio-marine-hall'),
Event.create!(title: 'Jorge Aragão', description: 'Dono de clássicos como "Eu e Você Sempre", “Lucidez”, “Moleque Atrevido”, “Deus Manda” e “De Sampa a São Luiz”, o artista é um dos pilares do samba brasileiro.', venue: venues[20], price: 280.00, start_date: '25-01-2025', start_time: '21:00', end_date: '25-01-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934433/jorge_oup3oz.webp', purchase_link:'https://bileto.sympla.com.br/event/100923/d/289780'),
Event.create!(title: 'Fat Family canta Tim Maia', description: 'Como parte da comemoração de retorno aos palcos, o trio homenageia Tim Maia em um show especial, cantando hits como “Gostava Tanto de Você”.', venue: venues[20], price: 200.00, start_date: '27-02-2025', start_time: '21:00', end_date: '27-02-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934431/fat_bogzsb.jpg', purchase_link:'https://bileto.sympla.com.br/event/101048/d/290252'),
Event.create!(title: 'Baile do Baleiro', description: 'Cantor vai rebobinar clássicos de nomes como Moraes Moreira, Originais do Samba, Tim Maia, Marina Lima, Belchior, Cassiano, Novos Baianos e Simonal.', venue: venues[20], price: 220.00, start_date: '07-03-2025', start_time: '20:00', end_date: '07-03-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934425/baleiro_kqnf4o.jpg', purchase_link:'https://bileto.sympla.com.br/event/101542/d/293486'),
Event.create!(title: 'Febem', description: 'Rapper apresenta o show do seu último álbum, “Abaixo do Radar”.', venue: venues[20], price: 190.00, start_date: '09-02-2025', start_time: '19:00', end_date: '09-02-2025', end_time: '22:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934430/febem_ilsa5i.webp', purchase_link:'https://bileto.sympla.com.br/event/101195/d/291312'),
Event.create!(title: 'Betina Astral', description: 'Show do álbum Rasante.', venue: venues[21], price: 0.00, start_date: '14-12-2024', start_time: '19:30', end_date: '14-12-2024', end_time: '20:30', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934426/betina_rzdy7f.png', purchase_link:'https://www.sescsp.org.br/programacao/betina-astral/'),
Event.create!(title: 'Oasis Live 25', description: 'O retorno dos irmãos Gallagher.', venue: venues[22], price: 240.00, start_date: '22-11-2025', start_time: '19:00', end_date: '22-11-2025', end_time: '23:00', url_image: 'https://res.cloudinary.com/dq3bwy9sm/image/upload/v1733934436/oasis_rj6hpm.jpg', purchase_link:'https://www.ticketmaster.com.br/event/oasis-venda-geral-22')
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
  { name: 'Acústico' },
  { name: 'Trap' },
  { name: 'Sertanejo' },
  { name: 'Carnaval' }
])

# 6. Associate Events with Genres
puts "Associando eventos com gêneros..."

# Hash com eventos e gêneros
event_genre_map = {
  'C6 Fest' => ['Festival', 'Jazz', 'Piano', 'Soul', 'Blues'],
  'Ney Matogrosso' => ['MPB'],
  'Oswaldo Montenegro' => ['MPB'],
  'Ana Castela' => ['Sertanejo', 'Pop'],
  'Alcione' => ['MPB', 'Samba'],
  'Chris Brown' => ['Estádio', 'R&B', 'Hip-Hop'],
  'Caetano & Bethânia' => ['MPB', 'Estádio'],
  'Amyl & The Sniffers' => ['Rock', 'Alternativa'],
  'Francisco, El Hombre' => ['Alternativa'],
  'Vapors of Morphine' => ['Rock', 'Alternativa'],
  'Mudhoney' => ['Rock', 'Alternativa'],
  'Tributo a Elton John' => ['Pop', 'Piano'],
  'Lobão' => ['Rock', 'Acústico'],
  'Ensaio Monobloco' => ['Samba', 'Carnaval'],
  'MartNália' => ['Samba', 'Pagode'],
  'Duda Beat' => ['Alternativa', 'MPB', 'Pop'],
  'Falamansa' => ['Forró'],
  'Hermeto Pascoal e Big Band' => ['MPB', 'Alternativa', 'Jazz'],
  'Romulo Fróes canta Transa' => ['MPB'],
  'Concerto de Natal por João Carlos Martins' => ['Piano', 'Clássica'],
  'Lacuna Coil' => ['Heavy Metal'],
  'Gessinger' => ['Rock', 'Acústico'],
  'Tarja e Marko Hietala' => ['Heavy Metal', 'Clássica'],
  'Jorge Vercillo' => ['MPB'],
  'Jorge Aragão' => ['Samba', 'Pagode'],
  'Fat Family canta Tim Maia' => ['MPB'],
  'Baile do Baleiro' => ['MPB'],
  'Febem' => ['Rap', 'Trap'],
  'Betina Astral' => ['MPB', 'Alternativa'],
  'Oasis Live 25' => ['Rock', 'Estádio']
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

puts "Database seeding completed!"
