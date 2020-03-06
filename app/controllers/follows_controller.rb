# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_follow, only: %i[show edit update destroy]

  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  # GET /follows/1.json
  def show; end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET follows/follow/id
  def follow
    following_id = params[:id]
    if following_id
      if Validation::Follow.check_if_already_following(current_user, following_id)
        message = MESSAGES['follow']['already_following']
      else
        message = if FollowService.follow_user(current_user, following_id)
                    MESSAGES['follow']['success']
                  else
                    MESSAGES['follow']['failure']
                  end
      end
    else
      message = MESSAGES['follow']['failure']
    end
    flash[:notice] = message
    redirect_to root_path
  end

  # GET follows/unfollow/id
  def unfollow
    unfollowing_id = params[:id]
    message = if unfollowing_id
                if FollowService.unfollow_user(current_user, unfollowing_id)
                  MESSAGES['unfollow']['success']
                else
                  MESSAGES['unfollow']['failure']
                          end
              else
                MESSAGES['unfollow']['failure']
              end
    flash[:notice] = message
    redirect_to root_path
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(follow_params)

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_follow
    @follow = Follow.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def follow_params
    params.fetch(:follow, {})
  end
end
