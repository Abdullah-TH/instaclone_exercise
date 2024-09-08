class LikesController < ApplicationController
  before_action :set_likable

  def create
    current_user.like!(@likable)
  end

  def destroy
    current_user.unlike!(@likable)
  end

  private

  def set_likable
    if params[:post_id].present?
      @likable = Post.find(params[:post_id])
    elsif params[:comment_id].present?
      @likable = Comment.find(params[:comment_id])
    end
  end
end