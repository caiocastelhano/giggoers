class User < ApplicationRecord
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

  # Relacionamento: Usuário tem acesso a eventos por meio dos favoritos.
  has_many :events, through: :favorites

  # Validações
  # Valida que o campo `name` está presente e possui no máximo 50 caracteres.
  validates :name, presence: true, length: { maximum: 50 }

  # Valida que o campo `email` está presente, é único e segue um formato de email válido.
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Valida que o campo `password` está presente e tem no mínimo 6 caracteres.
  validates :password, presence: true, length: { minimum: 6 }
end
