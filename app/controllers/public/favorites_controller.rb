class Public::FavoritesController < ApplicationController

  before_action :authenticate_member!

  def index
    @member = current_member
    favorites = Favorite.where(member_id: @member.id).pluck(:target_id)
    @targets = Target.order(created_at: :desc).find(favorites)
  end


  def create
    @target = Target.find(params[:target_id])
    favorite = current_member.favorites.create(target_id: params[:target_id])
    favorite.create_activities(favorite, "favorite", current_member.id, @target.member_id)
  end

  def destroy
    @target = Target.find(params[:target_id])
    favorite = current_member.favorites.find_by(target_id: params[:target_id])
    if favorite.present?
      favorite.destroy
    end
  end
end
