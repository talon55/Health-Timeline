module ApplicationHelper
  def greeting user
    unless user.blank?
      "Hello, #{current_user.email}!"
    else
      "Hello"
    end
  end

  def body_css(controller)
    if controller.include? 'devise'
      nil
    else
      controller.parameterize
    end
  end

end
