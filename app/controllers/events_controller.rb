class EventsController < ApplicationController
  def index
    # Garanta que @events sempre seja uma coleção, mesmo que vazia
    @events = Event.all

    # Busca por query
    if params[:query].present?
      @events = @events.joins(:genres, :venue)
        .where(
          "events.title ILIKE :query OR
           events.description ILIKE :query OR
           venues.name ILIKE :query OR
           genres.name ILIKE :query",
          query: "%#{params[:query]}%"
        )
        .distinct
    end

    # Filtro por gênero
    if params[:genre].present? && params[:genre] != "Todos"
      @events = @events.joins(:genres).where(genres: { name: params[:genre] })
    end

    # Ordenação
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

    # Adicione um tratamento para o caso de não haver eventos
    # Prepare markers for events
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

    # Add user's geolocation as a marker
    user_location = fetch_user_location
    if user_location
      @markers << {
        lat: user_location[:latitude],
        lng: user_location[:longitude],
        info_window_html: "Your Location",
        marker_type: "user"
      }
    end

    # Add list of user's favorite events, if logged in
    @favorites = user_signed_in? ? current_user.favorites.pluck(:event_id) : []
  end

  def show
    @event = Event.includes(:venue, :genres).find(params[:id])

    # Load user's favorites, if logged in
    @favorites = if user_signed_in?
                   current_user.favorites.pluck(:event_id)
                 else
                   [] # Empty list for non-logged-in users
                 end
  end

  def user_geolocation
    if current_user
      current_user.latitude = params[:latitude]
      current_user.longitude = params[:longitude]
      current_user.save
    end
  end

  private

  # Method to fetch user's geolocation
  def fetch_user_location
    #ip = request.remote_ip
    #location = Geocoder.search(ip).first
    return unless current_user.latitude && current_user.longitude

    { latitude: current_user.latitude, longitude: current_user.longitude }
  end
end
