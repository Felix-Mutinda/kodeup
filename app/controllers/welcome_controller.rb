class WelcomeController < ApplicationController
  def index
    
  end

  def login
    @myFlash = " "
  end

  def create
    @current_user = User.find_by(email: params[:username]) || User.find_by(username: params[:username])

    if @current_user && @current_user.authenticate(params[:password])
      session[:current_user] = @current_user.id
     
      render html: "User is sucessfuly logged in, Authority #{@current_user.user_type}"
    else
      @myFlash = "Invalid Username or Email"
      render "login"
    end
  end

  def destroy
    session.delete(:current_user)
  end

  private
		def login_params
			# params.permit(:username, :password)
    end
      
end
