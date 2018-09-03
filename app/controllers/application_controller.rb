class ApplicationController < ActionController::Base
    
    include WelcomeHelper
    
    before_action :ensure_logged_in
end
