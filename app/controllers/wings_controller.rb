class WingsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :find_wing #use private method for finding wing as a before action call

    def new
        @wing = Wing.new(user_id: params[current_user.id])
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @wings = @user.wings
        else
            @wings = Wing.all 
        end
    end

    def show
        @user = User.find_by_id(params[:user_id])
    end

    def create
        @wing = current_user.wings.build(wing_params)

        if @wing.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end