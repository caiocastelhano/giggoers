class Event < ApplicationRecord
  belongs_to :venue
  has_many :favorites
  has_many :users, through: :favorites
  has_many :event_genres
  has_many :genres, through: :event_genres

  # Validações obrigatórias
  validates :title, :description, :start_date, :start_time, :venue_id, presence: true

  # Atributos opcionais
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :url_image, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }

  def self.search(query)
    joins(:genres, :venue)
      .where(
        "events.title ILIKE :query OR
         events.description ILIKE :query OR
         venues.name ILIKE :query OR
         genres.name ILIKE :query",
        query: "%#{query}%"
      )
      .distinct
  end
end
