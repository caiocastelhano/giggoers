class PagesController < ApplicationController
  def home
    # Carrega os eventos destacados
    @carousel_events = Event.limit(2) # Exemplos de eventos para o carrossel
    @card_events = Event.all.page(params[:page]).per(10) # Eventos paginados para os cards

    # Inicializa @favorites para verificar eventos favoritos
    if user_signed_in?
      @favorites = current_user.favorites.pluck(:event_id) # IDs dos eventos favoritos
    else
      @favorites = [] # Lista vazia se o usuário não estiver logado
    end
  end
end
