class LikesController < ApplicationController
  def create
    @like = Like.new
    @current_user.likes << @like
    post = Post.find params[:post_id]
    post.likes << @like

    redirect_to request.referer
  end
end
