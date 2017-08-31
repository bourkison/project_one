class PagesController < ApplicationController
  def home
    @post = Post.new
    @comment = Comment.new
    @like = Like.new
    # When we get to the home page, check if the user is logged in. If so, get the posts for it and chuck it in an array.
    if @current_user.present?
      # Start off by adding the own users posts to the array.
      @posts = @current_user.posts
      # Now loop through everyone the user is following and add their posts to the array
      @current_user.following.each do |following|
        @posts += following.posts
      end
      # Now sort the array of posts
      @posts = @posts.sort_by(&:created_at).reverse

    end
  end
end
