# User controller
class UsersController < ApplicationController
  #autocomplete :field, :name, :class_name => 'ActsAsTaggableOn::Tag'
  # Finds a user by id
  def show
    @user = User.find(params[:id])
  end

  # Edit ation
  def edit
    @user = User.find(params[:id])
  end

  # Updates a user
  def update
    @user = User.find(params[:id])
    puts @users
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  # Needed params for operations
  def user_params
    params.require(:user).permit!
  end

  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end
end
