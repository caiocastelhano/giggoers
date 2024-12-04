class ApplicationController < ActionController::Base
  # Configura os parâmetros permitidos para Devise antes de qualquer ação do Devise ser chamada.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Este método adiciona parâmetros extras que o Devise deve aceitar no cadastro e atualização de usuários.
  def configure_permitted_parameters
    # Permite o campo `name` durante o cadastro (`sign_up`) do usuário.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Permite o campo `name` durante a atualização de conta (`account_update`) do usuário.
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
