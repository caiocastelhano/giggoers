class FavoritesController < ApplicationController
  before_action :authenticate_user! # Garante que o usuário esteja logado
  before_action :set_event, only: [:create]
  before_action :set_favorite, only: [:destroy]

  # GET /favorites
  def index
    @favorites = current_user.favorites.includes(:event).select { |favorite| favorite.event.present? }
    @favorite_event_ids = @favorites.map { |favorite| favorite.event.id }
  end

  # POST /favorites
  def create
    @favorite = current_user.favorites.build(event: @event)

    if @favorite.save
      redirect_to favorites_path, notice: 'Event was successfully added to favorites. Here is your list of favorites.'
    else
      redirect_to events_path, alert: 'Unable to add event to favorites.'
    end
  end

  # DELETE /favorites/:id
  def destroy
    if @favorite.destroy
      redirect_to favorites_path, notice: 'Favorite successfully removed.'
    else
      redirect_to favorites_path, alert: 'There was an issue removing the favorite.'
    end
  end

  private

  # Define o evento com base no `event_id` fornecido
  def set_event
    @event = Event.find(params[:event_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: 'Event not found.'
  end

  # Define o favorito com base no `id` fornecido e verifica se pertence ao usuário atual
  def set_favorite
    @favorite = current_user.favorites.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to favorites_path, alert: 'Favorite not found.'
  end
end
