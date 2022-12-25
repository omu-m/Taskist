class Public::TargetsController < ApplicationController
  before_action :authenticate_member!

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    @target.member_id = current_member.id
    if @target.save
      flash[:notice] = "目標「#{target_params[:goal]}」を投稿しました。"
      redirect_to targets_path
    else
      flash[:alert] = "入力内容を確認してください。"
      render "new"
    end
  end

  def index
    @targets = Target.all
  end

  def show
    @target = Target.find(params[:id])
  end

  def edit
  end

  private

  def target_params
    params.require(:target).permit(:goal, :reason, :start_date, :end_date)
  end
end
