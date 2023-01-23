class Public::FavoritesController < ApplicationController

  def create
    @target = Target.find(params[:target_id])
    current_member.favorites.create(target_id: params[:target_id])
  end

  def destroy
    @target = Target.find(params[:target_id])
    favorite = current_member.favorites.find_by(target_id: params[:target_id])
    if favorite.present?
      favorite.destroy
    end
  end
end
