class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # Validações
  validates :user_id, :event_id, presence: true
  validates :user_id, uniqueness: { scope: :event_id } # Um usuário só pode favoritar um evento uma vez
end
