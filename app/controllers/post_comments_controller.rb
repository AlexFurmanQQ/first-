class PostCommentsController < ApplicationController
    def create
        Print.p(params)
        @post = Post.find(params[:post_id])
        @comment = @post.post_comments.create(post_comments_params)
        redirect_to post_path(@post)
    
    end

    private
    def post_comments_params
        params.require(:post_comment).permit(:message)
    end 
end