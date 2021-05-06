class CommentsController < ApplicationController
    before_action :set_post
    def create
        @comment = @post.comments.create(comment_params)
        # We want to show the comment in the context of the Post
        redirect_to @post
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to @post # @post will be set by before_action
    end

    private
    def comment_params
        params.require(:comment).permit(:name, :content)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
  
end
