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