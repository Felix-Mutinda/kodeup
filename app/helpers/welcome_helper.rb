module WelcomeHelper

    # logs in a user
    def log_in(user)
        session[:user_id] = user.id
    end

    # return the currently logged in user, if any
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # returns true if the user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end

    # logs out user
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

private
    # makes sure a user is logged in
    def ensure_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
end
