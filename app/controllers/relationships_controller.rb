class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    # フォロー時に通知のデータを作成する
    @user =  User.find_by(params[:following_id])
    @user.create_notification_follow!(current_user)
    redirect_to request.referer
  end
  
  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referer
  end
end
