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
    redirect_to edit_user_registration_path
  end

  def destroy
    if params[:user_share_ids].blank?
      redirect_to edit_user_registration_path, alert: "Please select a user to revoke sharing"
      return
    end

    success = current_user.stop_sharing_with params[:user_share_ids]

    if success
      flash[:notice] = "You are no longer sharing with REPLACE WITH NAME"
    else
      flash[:alert] = "We cannot revoke sharing with REPLACE WITH NAME"
    end
    redirect_to edit_user_registration_path
  end
end
