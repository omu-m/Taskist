class Admin::TargetsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @targets = Target.all.order(updated_at: :desc).page(params[:page]).per(5)
    if params[:status].nil?
      @targets = @targets.page(params[:page])
    else
      @targets = @targets.where(completion_status: params[:status]).page(params[:page])
    end
  end

  def sort_targets
    if params[:new]
      @targets = Target.all.order(created_at: "DESC").page(params[:page])
    elsif params[:old]
      @targets = Target.all.order(created_at: "ASC").page(params[:page])
    end
    render "index"
  end

  def show
    @target = Target.find(params[:id])
  end

  def destroy
    target = Target.find(params[:id])
    target.destroy
    flash[:alert] = "目標「#{target.goal}」を削除しました"
    redirect_to  admin_targets_path
  end
end
