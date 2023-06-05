class PostsController < ApplicationController 
    before_action :set_post, only: %i[ show edit update destroy ]
    def index
        @posts = Post.all
    end
    def show
        @post_coments = @post.post_coments.order(created_at: :desc)
        @post_coment = @post.post_coments.build
    end
    def new
        @post = Post.new   
    end
    def create
        @post = Post.new post_params
        @post.publication_date = Time.now
        if @post.save 
            redirect_to post_path @post 
        else
           render :new
        end
    end
    def edit
    end
    def update
        if @post.update(post_params)
            redirect_to post_path @post 
        else 
            render :edit
        end
    end
    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private 
    def post_params
        params.require(:post).permit(:title, :body)

    end
    def set_post
        @post = Post.find params["id"]
    end

end


