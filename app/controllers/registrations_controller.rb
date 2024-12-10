class RegistrationsController < Devise::RegistrationsController
  protected

  # Permitir apenas os campos que queremos atualizar
  def account_update_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
