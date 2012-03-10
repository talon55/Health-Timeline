class RegistrationsController < Devise::RegistrationsController

  def edit
    @shared_users = current_user.shared_users
    super
  end
end
