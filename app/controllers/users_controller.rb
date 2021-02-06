class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

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
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, games_attributes: [:title, :platform, :user_id, :genre_id])
    end

end