class EventGenre < ApplicationRecord
  belongs_to :event
  belongs_to :genre

  # Validações
  validates :event_id, :genre_id, presence: true
  validates :event_id, uniqueness: { scope: :genre_id } # Um evento não pode ter o mesmo gênero mais de uma vez
end
