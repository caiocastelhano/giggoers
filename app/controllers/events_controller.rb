class EventsController < ApplicationController
  def index
    @events = if params[:query].present?
                Event.search(params[:query])
              else
                Event.all
              end

    # Adicionando paginação
    @events = @events.page(params[:page]).per(12)

    # Preparar markers para o mapa
    @markers = @events.map do |event|
      venue = event.venue
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(
          partial: "events/info_window",
          locals: { event: event, venue: venue }
        )
      }
    end

    # Adicionar lista de favoritos do usuário, se logado
    if user_signed_in?
      @favorites = current_user.favorites.pluck(:event_id)
    else
      @favorites = []
    end
  end

  def show
    @event = Event.includes(:venue, :genres).find(params[:id])

    # Carrega os favoritos do usuário, se logado
    if user_signed_in?
      @favorites = current_user.favorites.pluck(:event_id)
    else
      @favorites = [] # Lista vazia para não logados
    end
  end
end
