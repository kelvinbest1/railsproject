class UserRestaurantsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @restaurants = @user.restaurants
    end
end