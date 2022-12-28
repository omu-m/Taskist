class Public::TasksController < ApplicationController
  before_action :authenticate_member!

  def create

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
