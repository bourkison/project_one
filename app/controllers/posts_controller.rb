class PostsController < ApplicationController

  def create
    cloudinary = Cloudinary::Uploader.upload(params[:post][:image])
    @post = Post.new post_params
    @post.image = cloudinary["url"]
    @post.save

    @current_user.posts << @post
    redirect_to request.referer
  end

  def destroy
    post = Post.find params[:id]
    post.destroy

    redirect_to request.referer
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
