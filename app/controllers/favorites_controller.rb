class FavoritesController < ApplicationController
  before_action :authenticate_user! # Garante que o usuário esteja logado

  # GET /favorites
  def index
    @favorites = current_user.favorites.includes(:event).select { |favorite| favorite.event.present? }
    @favorite_event_ids = @favorites.map { |favorite| favorite.event.id }
  end

  # POST /favorites
  def create
    event = Event.find(params[:event_id]) # Associa ao evento via `params[:event_id]`
    current_user.favorites.create!(event: event)

    render turbo_stream: turbo_stream.replace(event, partial: "favorites/btn",
      locals: { event: event })

  end

  # DELETE /favorites/:id
  def destroy
    favorite = current_user.favorites.find(params[:id]) # Busca favorito pelo ID
    event = favorite.event
    favorite.destroy

    render turbo_stream: turbo_stream.replace(event, partial: "favorites/btn",
      locals: { event: event })
  end
end
