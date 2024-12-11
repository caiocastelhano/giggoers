class EventsController < ApplicationController
  def index
    # Inicializa a coleção de eventos
    @events = Event.all

    # Aplica a busca (query)
    if params[:query].present?
      @events = @events.joins(:genres, :venue)
                       .where(
                         "events.title ILIKE :query OR
                          events.description ILIKE :query OR
                          venues.name ILIKE :query",
                         query: "%#{params[:query]}%"
                       ).distinct
    end

    # Aplica o filtro por gênero
    if params[:genre].present? && params[:genre] != "Todos"
      @events = @events.joins(:genres).where(genres: { name: params[:genre] }).distinct
    end

    # Aplica a ordenação
    case params[:sort]
    when 'date_asc'
      @events = @events.order(start_date: :asc)
    when 'date_desc'
      @events = @events.order(start_date: :desc)
    when 'price_asc'
      @events = @events.order(price: :asc)
    when 'price_desc'
      @events = @events.order(price: :desc)
    end

    # Paginação
    @events = @events.page(params[:page]).per(12)

    # Geração de marcadores para o mapa
    @markers = @events.any? ? @events.map do |event|
      venue = event.venue
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(
          partial: "events/info_window",
          locals: { event: event, venue: venue }
        ),
        marker_type: "event"
      }
    end : []

    # Adiciona a localização do usuário
    if (user_location = fetch_user_location)
      @markers << {
        lat: user_location[:latitude],
        lng: user_location[:longitude],
        info_window_html: "Sua localização",
        marker_type: "user"
      }
    end

    # Carrega eventos favoritos do usuário, se estiver logado
    @favorites = user_signed_in? ? current_user.favorites.pluck(:event_id) : []
  end

  def show
    @event = Event.find(params[:id])
  end


  private

  # Recupera a localização do usuário
  def fetch_user_location
    if current_user&.latitude && current_user&.longitude
      { latitude: current_user.latitude, longitude: current_user.longitude }
    end
  end
end
