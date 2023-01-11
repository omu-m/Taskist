class Admin::MembersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @members = Member.all
    @members = @members.order(updated_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
  end
end
