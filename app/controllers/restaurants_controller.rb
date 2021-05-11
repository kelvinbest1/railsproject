class RestaurantsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :find_restaurant, only: [:show]

    
        def index
            if params[:user_id]
                @user = User.find_by_id(params[:user_id])
                @users = User.find_by_id(params[:user_id]).name
                @restaurants = @user.restaurants
            else
                
                @restaurants = Restaurant.all
            end
        end
    
       
    

    def new
        @restaurant = Restaurant.new
    end

    def show
       
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
    def find_restaurant
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name)
    end

end