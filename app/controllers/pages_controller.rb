class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # Carrega os eventos destacados no carrossel
    @carousel_events = Event.limit(5)

    # Carrega os eventos para os cards, excluindo os do carrossel
    @card_events = Event.where.not(id: @carousel_events.pluck(:id))
                         .page(params[:page])
                         .per(10)

    # Inicializa @favorites para verificar eventos favoritos
    if user_signed_in?
      @favorites = current_user.favorites.pluck(:event_id)
    else
      @favorites = []
    end
  end
end
