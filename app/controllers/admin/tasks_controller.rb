class Admin::TasksController < ApplicationController

  before_action :authenticate_admin!

  def index
    @tasks = Task.all.page(params[:page]).per(5)
  end

  def show
    @member = Member.find(params[:id])
    @tasks = @member.tasks.page(params[:page]).per(6)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:alert] = "タスク「#{task.content}」を削除しました"
    redirect_to request.referer
  end
end
