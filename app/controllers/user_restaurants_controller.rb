class UserRestaurantsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @wings = Wing.where(user: @user)
    end
end