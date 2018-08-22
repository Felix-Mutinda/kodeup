class PostsController < ApplicationController
    
    def index
        @posts = Post.all
        if User.find_by(id: session[:current_user])
            render 'welcome/index'
        else
            redirect_to 'welcom/login'
        end
    end
    
    def new
        @post = Post.new
    end
end
