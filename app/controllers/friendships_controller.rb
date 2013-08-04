class FriendshipsController < ApplicationController
  def create
    current_user.friendships.build({friend_id: params[:user_id]})
    current_user.save!
    redirect_to User.find(params[:user_id])
  end
  
  def destroy
    current_user.friendships.find_by_friend_id(params[:user_id]).destroy
    redirect_to User.find(params[:user_id])
  end  
end