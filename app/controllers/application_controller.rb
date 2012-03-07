class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|

    case exception.subject
    when Episode
      subject = exception.subject.title
    when User
      subject = exception.subject.email
    end
    flash[:alert] = "You do not have permission to #{exception.action} #{subject}"

    redirect_to :back
  end

end
