class WelcomeController < ApplicationController
  def index
  end

  def login
  end

  def create
	
  end

  private
		def login_params
			params.permit(:username, :password)
		end
end
