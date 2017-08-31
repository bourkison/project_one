class UsersController < ApplicationController

  before_action :check_if_logged_in, :only => [:edit]

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new user_params
    # If the user saves to the database with no issues:
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # Check if the params[:id] is equal to the @current_user id to make sure the user is not trying to update someone elses profile
    redirect_to root_path unless @current_user.id == params[:id].to_i
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params

    redirect_to root_path
  end

  def destroy
    user = User.find params[:id]
    User.destroy user.id
    @current_user = nil

    redirect_to root_path
  end

  def show
    @user = User.find params[:id]
    @post = Post.new
    @comment = Comment.new
    @like = Like.new
    render :show
  end

  def following
    user = User.find params[:id]
    # As we call this method for both follow and unfollow, check to see if the current_user is already following the user, and if so unfollow them, if not follow them.
    if @current_user.following?(user)
      @current_user.unfollow(user)
    else
      @current_user.follow(user)
    end
    redirect_to user
  end

  def followers
  end

  private
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :dob, :password, :password_confirmation)
  end

end
