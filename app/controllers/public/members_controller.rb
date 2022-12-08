class Public::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
  end

  def edit
  end

  def unsubscribe
  end

  private

  def member_params
    params.require(:member).permit(:email, :name, :profile_image)
  end
end
