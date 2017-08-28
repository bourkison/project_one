class PagesController < ApplicationController
  def home
    @post = Post.new
    @comment = Comment.new
  end
end
