class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # Validações
  validates :user_id, :event_id, presence: true
end
  