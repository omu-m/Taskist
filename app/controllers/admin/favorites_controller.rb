class Admin::FavoritesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @member = Member.find(params[:id])
    @favorites = Favorite.where(member_id: @member).pluck(:target_id)
    @targets = Target.order(created_at: :desc)
  end
end
