class Admin::TasksController < ApplicationController

  before_action :authenticate_admin!

  def index
    @tasks = Task.all
  end

  def show
    @member = Member.find(params[:id])
    @tasks = @member.tasks
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:alert] = "タスク「#{task.content}」を削除しました"
    redirect_to admin_targets_path
  end
end
