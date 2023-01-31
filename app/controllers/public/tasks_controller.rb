class Public::TasksController < ApplicationController
  before_action :authenticate_member!

  def create
    @target = Target.find(params[:target_id])
    @task = current_member.tasks.new(task_params)
    @task.target_id = @target.id
    @task.save
  end

  def edit
    @target = Target.find(params[:target_id])
    @target_task = Task.find(params[:id])
  end

  def update
    @target = Target.find(params[:target_id])
    @target_task = Task.find(params[:id])
    if @target_task.update(task_params)
      flash[:notice] = "タスク「#{task_params[:content]}」を編集しました。"
      redirect_to target_path(@target)
    else
      flash.now[:alert] = "入力内容を確認してください。"
      render "edit"
    end
  end

  def destroy
    @target = Target.find(params[:target_id])
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end

end
