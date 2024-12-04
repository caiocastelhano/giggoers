class Users::SessionsController < Devise::SessionsController
  def create
    # Log dos parâmetros recebidos
    Rails.logger.info "LOGIN PARAMETERS: #{params.inspect}"
    # Chama o método padrão do Devise
    super
  end
end
