class RegistrationsController < Devise::RegistrationsController
  protected

  # Permitir apenas os campos que queremos atualizar
  def account_update_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  # Sobrescrever o método destroy para cancelar a conta do usuário
 # def destroy
 #   resource.destroy # Remove o usuário atual
 #   Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name) # Finaliza a sessão
 #   yield resource if block_given? # Permite ações personalizadas após a destruição
 #   redirect_to after_sign_out_path_for(resource_name) # Redireciona após cancelar a conta
 # end
end
