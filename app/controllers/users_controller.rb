class UsersController < ApplicationController
  layout :application, except: [:show]
  before_action :check_user, only: [:show]
  def profile
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def check_user
    redirect_to root_path if current_user != User.find(params[:id])

    flash[:alert] = 'You can only see your own profile.' if current_user != User.find(params[:id])
  end
end
