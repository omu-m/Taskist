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

  def edit
  end

  def update
  end
end
