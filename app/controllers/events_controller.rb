class EventsController < ApplicationController
  def index
    @events = Event.includes(:venue, :genres)
    # Carrega eventos com seus relacionamentos para evitar N+1 queries

    @events = @events.where('start_date >= ?', Date.current)
    # Filtra apenas eventos futuros

    @events = @events.where('title ILIKE ? OR description ILIKE ?',
                           "%#{params[:query]}%",
                           "%#{params[:query]}%") if params[:query].present?
    # Busca por título ou descrição se houver query

    @events = @events.joins(:genres)
                    .where(genres: { id: params[:genre_id] }) if params[:genre_id].present?
    # Filtra por gênero se especificado

    @events = @events.where(start_date: Date.parse(params[:date])) if params[:date].present?
    # Filtra por data se especificada

    @events = @events.order(start_date: :asc)
    # Ordena por data crescente

    @events = @events.page(params[:page]).per(8)
    # Pagina resultados, 8 por página
  end

  def show
    @event = Event.includes(:venue, :genres).find(params[:id])
  end
end
