class PostsController < ApplicationController    

    def index
        if current_user.user_type == "viewer"
            @posts = Post.all
            render "posts/viewer_index"
        else
            @posts = Post.where(user_id: current_user.id)
            render "posts/author_index"
        end
    end
    
    def show
        @post = Post.find_by(id: params[:id]);

        if current_user.user_type == "viewer"
            render "posts/viewer_show"
        else
            render "posts/author_show"
        end
    end

    def new
        if current_user.user_type == "author"
            @post = Post.new
            render "posts/author_new"
        else
            redirect_to posts_url
        end
    end

    def edit 
        if current_user.user_type == "author"
            @post = Post.find_by(id: params[:id])
            render "posts/author_edit"
        else
            redirect_to posts_url
        end
    end


    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            flash[:success] = "Post was successfully added"
            redirect_to posts_path
        else
            flash.now[:danger] = "Posts can not be empty!"
            render "posts/author_new"
        end
    end


    def update
        @post =  Post.find_by(id: params[:id])
            
        if @post.update(post_params)
            redirect_to post_path(@post),
            success: "Post was successfully updated!"
        else
            flash.now[:danger] = "Post can't be empty!"
            render "posts/author_edit"
        end
    end


    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy

        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:title, :post)
        end
end
