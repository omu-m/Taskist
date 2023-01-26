class Admin::FavoritesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @member = current_member
    @favorites = Favorite.where(member_id: @member).pluck(:target_id)
    @targets = Target.order(created_at: :desc).find(@favorites)
  end
end
