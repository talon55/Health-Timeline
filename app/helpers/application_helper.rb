module ApplicationHelper
  def greeting user
    unless user.blank?
      "Hello, #{current_user.email}!"
    else
      "Hello!"
    end
  end
end
