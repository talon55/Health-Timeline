class UsersController < ApplicationController
  before_filter :authenticate_user!

  def update
    user = User.where(email: params[:user_email]).first
    success = current_user.share_with user if user.instance_of? User

    if success
      flash[:notice] = "You can now share with #{user.email}"
    elsif user # this should never happen
      flash[:alert] = "We could not share with #{user.email}"
    else
      flash[:alert] = "We could not find a user with this email."
    end
    redirect_to episodes_path
  end

  def destroy
    if params[:user_share_ids].blank?
      redirect_to episodes_path, alert: "Please select a user to revoke sharing"
      return
    end

    user = User.find(params[:user_share_ids])
    success = current_user.stop_sharing_with user.id

    if success
      remove_user(user)
      flash[:notice] = "You are no longer sharing with #{user.email}"
    else
      flash[:alert] = "We cannot revoke sharing with #{user.email}"
    end
    redirect_to episodes_path
  end

  private

  # This method unshares the argument user on all episodes owned by the current_user
  def remove_user user
    current_user.episodes.each do |episode|
      episode.users -= [user]
    end
  end
end
