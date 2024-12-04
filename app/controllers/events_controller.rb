class EventsController < ApplicationController
  def index
    if params[:query].present?
      @events = Event.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @events = Event.all
    end

    @events = @events.page(params[:page]).per(12)

    # Preparar markers para o mapa
    @markers = @events.map do |event|
      venue = event.venue
      {
        lat: event.venue.latitude,
        lng: event.venue.longitude,
        info_window_html: render_to_string(
          partial: "events/info_window",
          locals: {
            event: event,
            venue: venue
          }
        )
      }
    end
  end

  # def search
  #   @query = params[:query]
  #   @events = Event.where("name LIKE ?", "%#{@query}%")
  # end

  def show
    @event = Event.includes(:venue, :genres).find(params[:id])
  end
end
