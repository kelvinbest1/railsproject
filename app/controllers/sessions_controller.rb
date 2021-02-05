class SessionsController < ApplicationController

    def new
        @user = User.new
    end


    def create
        if auth_hash = request.env['omniauth.auth']
            @user = User.find_or_create_by_omniauth(auth_hash)
                session[:user_id] = @user.id
                redirect_to user_path(@user)