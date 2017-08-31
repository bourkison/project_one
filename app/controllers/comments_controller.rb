class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @current_user.comments << @comment
    post = Post.find params[:post_id]
    post.comments << @comment

    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
