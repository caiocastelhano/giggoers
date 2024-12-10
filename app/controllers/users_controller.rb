class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = current_user
    puts "Parâmetros recebidos: #{params[:user].inspect}" # Log para inspecionar os parâmetros

    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Perfil atualizado com sucesso.'
    else
      puts @user.errors.full_messages # Log para mostrar os erros
      render :show, alert: 'Erro ao atualizar o perfil.'
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      redirect_to root_path, notice: 'Sua conta foi cancelada com sucesso.'
    else
      redirect_to user_profile_path, alert: 'Erro ao cancelar a conta. Tente novamente mais tarde.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
  
