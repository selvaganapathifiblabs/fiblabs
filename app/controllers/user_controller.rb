# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!
  # GET user/profile/id
  def profile
    @user = User.find_by(id: params[:id].to_i)
    if @user
      @followers = @user.followers
      @followings = @user.followings
    else
      flash[:notice] = 'User not found'
      redirect_to root_path
    end
  end
end
