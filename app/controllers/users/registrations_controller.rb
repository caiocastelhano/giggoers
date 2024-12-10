class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
  
   # Após o registro bem-sucedido, redireciona para a página de perfil
  def after_sign_up_path_for(resource)
    user_profile_path(resource) # Redireciona para a página de perfil do usuário
  end

  def account_update_params
    # Permite os campos que você deseja atualizar, incluindo o avatar
    params.require(:user).permit(:name, :email, :avatar, :current_password)
  end
end
