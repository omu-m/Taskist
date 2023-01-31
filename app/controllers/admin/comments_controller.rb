class Admin::CommentsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @comments = Comment.all.page(params[:page]).per(5)
  end

  def search
    @comments = Comment.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @member = Member.find(params[:id])
    @comments = @member.comments.page(params[:page]).per(6)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:alert] = "コメント「#{comment.comment}」を削除しました"
    redirect_to request.referer
  end
end
