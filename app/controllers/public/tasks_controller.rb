class Public::TasksController < ApplicationController
  before_action :authenticate_member!

  def create
    @target = Target.find(params[:target_id])
    @task = current_member.tasks.new(task_params)
    @task.target_id = @target.id
    @task.save
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
