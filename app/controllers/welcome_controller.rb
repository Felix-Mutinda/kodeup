class WelcomeController < ApplicationController
  def index
  end

  def login
    # session[:user_id] = (0...1000).to_a.sample(1).join
  end

  def create
    # redirect_to posts_url
    # render html: session[:user_id]
    @current_user = User.find_by(email: params[:username]) || User.find_by(username: params[:username])

    if @current_user && (@current_user.password == params[:password])
      session[:current_user] = @current_user.id
      render html: "User is sucessfuly logged in, Authority #{@current_user.user_type}"
    else 
      render html: "Invalid username or Password!"
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
