class FavoritesController < ApplicationController
  before_action :authenticate_user! # Ensures user is logged in
  before_action :set_event, only: [:create]
  before_action :set_favorite, only: [:destroy]

  # GET /users/:user_id/favorites
  def index
    @favorites = current_user.favorites.includes(event: [:venue, :genres]).map do |favorite|
      {
        id: favorite.id,
        event_title: favorite.event.title,
        event_description: favorite.event.description,
        event_venue: favorite.event.venue.name,
        event_start_date: favorite.event.start_date,
        event_end_date: favorite.event.end_date || 'N/A',
        event_start_time: favorite.event.start_time,
        event_genres: favorite.event.genres.map(&:name)
      }
    end
  end

  # POST /users/:user_id/favorites
  def create
    @favorite = current_user.favorites.build(event: @event)

    if @favorite.save
      redirect_to user_favorites_path(current_user), notice: 'Event was successfully added to favorites.'
    else
      redirect_to events_path, alert: 'Unable to add event to favorites.'
    end
  end

  # DELETE /users/:user_id/favorites/:id
  def destroy
    @favorite.destroy
    redirect_to user_favorites_path(current_user), notice: 'Favorite was successfully removed.'
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: 'Event not found.'
  end

  def set_favorite
    @favorite = current_user.favorites.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to user_favorites_path(current_user), alert: 'Favorite not found.'
  end
end
