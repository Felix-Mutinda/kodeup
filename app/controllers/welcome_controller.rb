class WelcomeController < ApplicationController
  def index
  end

  def login
    
  end

  def create
	  redirect_to posts_url
  end

  private
		def login_params
			params.permit(:username, :password)
		end
end
