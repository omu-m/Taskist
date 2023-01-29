class Public::CommentsController < ApplicationController

  before_action :authenticate_member!

  def create
    @target = Target.find(params[:target_id])
    @comment = current_member.comments.new(comment_params)
    @comment.target_id = @target.id
    @comment.save
  end

  def destroy
    @target = Target.find(params[:target_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
