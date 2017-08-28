class UsersController < ApplicationController

  before_action :check_if_logged_in, :only => [:edit]

  def index
    @users = User.all
    render :index
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

  private
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :dob, :password, :password_confirmation)
  end

end
