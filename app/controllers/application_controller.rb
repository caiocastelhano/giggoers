class ApplicationController < ActionController::Base
  # Configura os parâmetros permitidos para Devise antes de qualquer ação do Devise ser chamada.
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Inclui helpers do Devise
  include Devise::Controllers::Helpers

    helper_method :user_signed_in?, :current_user

  # Exclui a autenticação global para a busca
  before_action :authenticate_user!

  # Redireciona para a tela de login após o logout
  def after_sign_out_path_for(resource_or_scope)
    root_path # Redireciona para a página inicial
  end

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  protected

  # Este método adiciona parâmetros extras que o Devise deve aceitar no cadastro e atualização de usuários.
  def configure_permitted_parameters
    # Permite o campo `name` durante o cadastro (`sign_up`) do usuário.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Permite o campo `name` durante a atualização de conta (`account_update`) do usuário.
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
