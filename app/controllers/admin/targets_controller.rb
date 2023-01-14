class Admin::TargetsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @targets = Target.all.order(updated_at: :desc)
  end

  def show
    @target = Target.find(params[:id])
  end

  def destroy
    target = Target.find(params[:id])
    target.destroy
    flash[:alert] = "目標「#{target.goal}」を削除しました"
    redirect_to  admin_target_path(@target)
  end
end
