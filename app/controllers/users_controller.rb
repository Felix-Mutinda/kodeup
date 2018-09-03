class UsersController < ApplicationController
    skip_before_action :ensure_logged_in, only: [:new, :create]

    def index
        redirect_to signup_url
    end

    def show
        @user = current_user
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)

        if @user.save
            log_in @user
            flash[:succsess] = "Welcome to the KodeUP community!"
            redirect_to posts_path
        else
            render "new"
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, 
                            :user_type, :password, :password_confirmation)
        end
end
