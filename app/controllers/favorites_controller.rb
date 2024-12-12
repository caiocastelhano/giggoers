class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Carrega os favoritos do usuário atual com seus eventos e gêneros
    @favorites = current_user.favorites.includes(event: [:genres, :venue])

    # Filtro por gênero
    if params[:genre].present? && params[:genre] != "Todos"
      @favorites = @favorites.joins(event: :genres)
                             .where(genres: { name: params[:genre] })
    end

    # Ordenação utilizando os atributos do modelo Event
    @favorites = case params[:sort]
    when "date_asc"
      @favorites.sort_by { |favorite| favorite.event.start_date }
    when "date_desc"
      @favorites.sort_by { |favorite| favorite.event.start_date }.reverse
    when "price_asc"
      @favorites.sort_by { |favorite| favorite.event.price || 0 }
    when "price_desc"
      @favorites.sort_by { |favorite| favorite.event.price || 0 }.reverse
    else
      @favorites
    end

    # Garante que apenas eventos presentes sejam exibidos
    @favorites = @favorites.select { |favorite| favorite.event.present? }

    # Adiciona paginação
    @favorites = Kaminari.paginate_array(@favorites).page(params[:page]).per(10)
  end

  def create
    event = Event.find(params[:event_id])
    current_user.favorites.create!(event: event)

    render turbo_stream: turbo_stream.replace(event, partial: "favorites/btn", locals: { event: event })
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    event = favorite.event
    favorite.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(event, partial: "favorites/btn", locals: { event: event })
      end
      format.html { redirect_to favorites_path, notice: "Favorito removido com sucesso." }
    end
  end
end
