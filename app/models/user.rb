class User < ApplicationRecord
  attr_accessor :change_password
  # Inclui os módulos padrão do Devise.
  # - :database_authenticatable - Para autenticação básica com email e senha.
  # - :registerable - Permite o cadastro de novos usuários.
  # - :recoverable - Permite recuperação de senha.
  # - :rememberable - Adiciona funcionalidade "lembrar-me".
  # - :validatable - Adiciona validações padrão para email e senha.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relacionamento: Um usuário pode ter muitos favoritos.
  has_many :favorites
  
  has_one_attached :avatar
  # Relacionamento: Usuário tem acesso a eventos por meio dos favoritos.
  has_many :events, through: :favorites

  # Validações
  # Valida que o campo `name` está presente e possui no máximo 50 caracteres.
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
end
