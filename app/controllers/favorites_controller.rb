class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # GET /favorites
  def index
    @favorites = current_user.favorites.includes(:event).select { |favorite| favorite.event.present? }

    # Aplicando filtros
    if params[:genre].present? && params[:genre] != "Todos"
      @favorites = @favorites.select do |favorite|
        favorite.event.genres.map(&:name).include?(params[:genre])
      end
    end

    # Ordenação
    case params[:sort]
    when "date_asc"
      @favorites = @favorites.sort_by { |favorite| favorite.event.start_date }
    when "date_desc"
      @favorites = @favorites.sort_by { |favorite| favorite.event.start_date }.reverse
    when "price_asc"
      @favorites = @favorites.sort_by { |favorite| favorite.event.price }
    when "price_desc"
      @favorites = @favorites.sort_by { |favorite| favorite.event.price }.reverse
    end

    @favorite_event_ids = @favorites.map { |favorite| favorite.event.id }
  end

  # POST /favorites
  def create
    event = Event.find(params[:event_id])
    current_user.favorites.create!(event: event)

    render turbo_stream: turbo_stream.replace(event, partial: "favorites/btn",
                                              locals: { event: event })
  end

  # DELETE /favorites/:id
  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    respond_to do |format|
      format.turbo_stream do
        if current_user.favorites.exists?
          render turbo_stream: turbo_stream.remove("favorite_#{favorite.id}")
        else
          render turbo_stream: turbo_stream.replace("favorites_list", partial: "favorites/empty")
        end
      end
      format.html { redirect_to favorites_path, notice: "Favorito removido com sucesso." }
    end
  end

end
