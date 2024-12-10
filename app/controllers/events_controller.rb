class EventsController < ApplicationController
  def index
    Rails.logger.info "\n\n\n\n #{current_user.id} \n\n\n"
    # Fetch events based on query or all events
    @events = if params[:query].present?
                Event.search(params[:query], params[:sort_by])
              else
                Event.all
              end

    # Add pagination
    @events = @events.page(params[:page]).per(12)

    # Prepare markers for events
    @markers = @events.map do |event|
      venue = event.venue
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(
          partial: "events/info_window",
          locals: { event: event, venue: venue }
        ),
        marker_type: "event" # Differentiate event markers
      }
    end

    # Add user's geolocation as a marker
    user_location = fetch_user_location
    if user_location
      @markers << {
        lat: user_location[:latitude],
        lng: user_location[:longitude],
        info_window_html: "Your Location",
        marker_type: "user" # Differentiate user marker
      }
    end

    # Add list of user's favorite events, if logged in
    @favorites = if user_signed_in?
                   current_user.favorites.pluck(:event_id)
                 else
                   []
                 end
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
