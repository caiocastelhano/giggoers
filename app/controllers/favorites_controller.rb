class FavoritesController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in

  def index
    @favorites = current_user.favorites.includes(:event) # Fetch user's favorites with associated events
  end
end
