class EventsController < ApplicationController
  def index
    Rails.logger.info "\n\n\n\n User ID: #{current_user.id} \n\n\n"

    # Busca eventos com paginação
    @events = if params[:query].present?
                Event.search(params[:query], params[:sort_by])
              else
                Event.all
              end.page(params[:page]).per(12)

    # Gera os marcadores para o mapa
    @markers = @events.map do |event|
      venue = event.venue
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(
          partial: "events/info_window",
          locals: { event: event, venue: venue }
        ),
        marker_type: "event" # Tipo de marcador
      }
    end

    # Adiciona localização do usuário
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
    # Busca o evento específico com suas associações
    @event = Event.includes(:venue, :genres).find(params[:id])

    # Carrega favoritos, se aplicável
    @favorites = user_signed_in? ? current_user.favorites.pluck(:event_id) : []
  end

  def user_geolocation
    if current_user
      current_user.update(latitude: params[:latitude], longitude: params[:longitude])
    end
  end

  private

  # Recupera a localização do usuário
  def fetch_user_location
    if current_user&.latitude && current_user&.longitude
      { latitude: current_user.latitude, longitude: current_user.longitude }
    end
  end
end
