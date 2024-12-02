class Venue < ApplicationRecord
  has_many :events

  # Validações obrigatórias
  validates :name, :address, presence: true

  # Atributos opcionais
  validates :latitude, :longitude, numericality: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :url_image, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }
end
