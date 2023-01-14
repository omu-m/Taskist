class Admin::MembersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @members = Member.all
    @members = @members.order(updated_at: :desc)
  end

  def show
    @member = Member.find(params[:id])
    @targets = @member.targets
    @tasks = @member.tasks
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:is_deleted)
  end
end
