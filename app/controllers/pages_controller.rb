class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @carousel_events = Event.limit(3)   # Busca os primeiros 3 eventos para o carrossel
    @card_events = Event.limit(10).offset(3) # Busca os próximos 10 eventos para os cards
  end
end
