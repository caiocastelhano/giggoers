class Genre < ApplicationRecord
  has_many :event_genres
  has_many :events, through: :event_genres

  # Validações
  validates :name, presence: true, uniqueness: true
end
