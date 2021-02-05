class RestaurantsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @restaurants = Restaurant.genre_with_most_games #scope method for index finding the restaurant with the most games
    end

    def new
        @restaurant = Restaurant.new
    end
