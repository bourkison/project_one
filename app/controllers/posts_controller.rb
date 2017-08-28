class PostsController < ApplicationController

  def create

    @post = Post.new post_params
    @current_user.posts << @post
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
