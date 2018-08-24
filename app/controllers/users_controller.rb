class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end
end
