class Admin::CommentsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @comments = Comment.all
  end

  def show
    @member = Member.find(params[:id])
    @comments = @member.comments
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:alert] = "コメント「#{comment.comment}」を削除しました"
    redirect_to request.referer
  end
end
