module ApplicationHelper
  def greeting user
    unless user.blank?
      "Hello, #{current_user.email}!"
    else
      "Welcome"
    end
  end
end
