module ApplicationHelper
  def greeting user
    unless user.blank?
      "Logged in as: #{current_user.email}"
    else
      "Sign In or Create an Account"
    end
  end

  def body_css(controller)
    if controller.include? 'devise'
      nil
    else
      controller.parameterize
    end
  end

  def title
    base_title = "MedLog"
    if @title.blank?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
