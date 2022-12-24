class Public::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
    @targets = @member.targets.order(updated_at: :desc)
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:notice] = "登録情報を変更しました。"
      redirect_to member_path
    else
      flash[:notice] = "登録情報の変更に失敗しました。"
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdrawal
    @member = current_member
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:email, :name, :profile_image)
  end
end
