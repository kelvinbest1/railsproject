class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    
        def index
            @users = User.all 
        end
    
        def search
            @users = User.user_search(params[:name])
            render :index
        end
    
        def new
            @user = User.new
            @user.wings.build #nested attributes build for new view in user signup
        end
    
        def create
            @user = User.new(user_params)
    
            if @user.save
                flash.notice = "You have successfully created an account"
                session[:user_id] = @user.id
                redirect_to @user
            else
                flash.alert = "Oh no, your account wasn't created, please correct errors"
                render :new
            end
        end
    
        def show
            redirect_if_not_logged_in
            @user = User.find_by_id(params[:id])
        end
    
        private 
    
        def user_params
            params.require(:user).permit(:name, :email, :password, wings_attributes: [:style, :flavor, :user_id, :restaurant_id])
        end
    
    end

    