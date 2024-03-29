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
      flash.now[:alert] = "入力内容を確認してください。"
      render "new"
    end
  end

  def index
    @targets = Target.all.order(updated_at: :desc).page(params[:page]).per(5)
    if params[:status].nil?
      @targets = @targets.page(params[:page])
    else
      @targets = @targets.where(completion_status: params[:status]).page(params[:page])
    end
  end

  def search
    @targets = Target.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    render "index"
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
    @target_task = Task.new
    @target_comment = Comment.new
  end

  def destroy
    @target = Target.find(params[:id])
    @target.destroy
    flash[:alert] = "目標「#{@target.goal}」を削除しました"
    redirect_to targets_path
  end

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])
    if @target.update(target_params)
      flash[:notice] = "目標「#{target_params[:goal]}」を編集しました。"
      redirect_to target_path
    else
      flash.now[:alert] = "入力内容を確認してください。"
      render "edit"
    end
  end

  private

  def target_params
    params.require(:target).permit(:goal, :reason, :start_date, :end_date, :completion_status)
  end
end
