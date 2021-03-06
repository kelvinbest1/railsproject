class RestaurantsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @restaurants = Restaurant.all
       
    end

    def new
        @restaurant = Restaurant.new
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        @users = @restaurant.users
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            flash.notice = "You have successfully added a restaurant"
            redirect_to user_path(current_user)
        else
            flash.alert = "Oh no, your restaurant wasn't saved. Can you please try again"
            render :new
        end
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:restaurant_data)
    end

end