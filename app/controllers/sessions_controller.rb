class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    def new
        @user = User.new
    end


    def create
        if auth_hash = request.env['omniauth.auth']
            @user = User.find_or_create_by_omniauth(auth_hash)
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                @user = User.find_by(email: params[:email])
                if @user && @user.authenticate(params[:password])
                    flash.notice = "You have successfully login"
                    session[:user_id] = @user.id
                    redirect_to user_path(@user)
                else
                    flash.alert = "Oh no, you were not signed in, please try again"
                    redirect_to login_path
                end
            end
        end
    
        def destroy
            session.clear
            flash.notice = "You have successfully logged out"
            redirect_to login_path
        end
    
    end