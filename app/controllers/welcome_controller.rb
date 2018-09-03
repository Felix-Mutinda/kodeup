class WelcomeController < ApplicationController
  skip_before_action :ensure_logged_in, except: :destroy
  def index
    
  end

  def login
    @myFlash = nil
  end

  def create
    @user = User.find_by(email: params[:username].downcase) || 
                    User.find_by(username: params[:username] )

    if @user && @user.authenticate(params[:password])
      log_in @user
      redirect_to posts_path
    else
      @myFlash = "Invalid Username or Email"
      render "login"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private
		def login_params
			params.permit(:username, :password)
    end
      
end
