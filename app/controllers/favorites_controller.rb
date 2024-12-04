class FavoritesController < ApplicationController
  before_action :authenticate_user! # Ensures user is logged in
  before_action :set_event, only: [:create]
  before_action :set_favorite, only: [:destroy]

  # GET /users/:user_id/favorites
  def index
    @favorites = Favorite.where(user: current_user)
  end

  # POST /users/:user_id/favorites
  def create
    @favorite = Favorite.new(user: current_user, event: @event)
    if @favorite.save
      redirect_to favorites_path, notice: 'Event was successfully added to favorites.Here is your list of favorites'
    else
      redirect_to events_path, alert: 'Unable to add event to favorites.'
    end
  end

  # DELETE /users/:user_id/favorites/:id
  def destroy
    @favorite.destroy
    redirect_to favorites_path, notice: 'Favorite was successfully removed.'
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
