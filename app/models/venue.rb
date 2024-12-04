class Venue < ApplicationRecord
  has_many :events

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Validações obrigatórias
  validates :name, :address, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Validações das coordenadas (opcional, pois o geocoder irá preenchê-las)
  validates :latitude, :longitude, numericality: true, allow_nil: true

  # Validação da URL da imagem (opcional)
  validates :url_image, format: {
    with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
    allow_blank: true
  }
end

