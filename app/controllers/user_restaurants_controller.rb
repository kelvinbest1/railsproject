class UserRestaurantsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @wings = current_user.wings 
    end
end