class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        name: venue.name,
        address: venue.address,
        capacity: venue.capacity,
        info_window_html: render_to_string(partial: "venues/info_window", locals: { venue: venue }),
      }
    end
  end
end
