class WingsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :find_wing #use private method for finding game as a before action call

    def new
        @wing = Wing.new(user_id: params[current_user.id])
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @wings = @user.games
        else
            @wings = Wing.all 
        end
    end
