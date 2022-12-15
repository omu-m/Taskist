class Public::TargetsController < ApplicationController

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    @target.member_id = current_member.id
    if @target.save
      flash[:notice] = "正常に作成されました。"
      redirect_to targets_path
    else
      flash[:alert] = "作成に失敗しました。"
      render "new"
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def target_params
    params.require(:target).permit(:goal, :reason, :deadline)
  end
end
