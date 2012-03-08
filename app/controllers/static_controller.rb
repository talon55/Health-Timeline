class StaticController < ApplicationController
  def home
    redirect_to episodes_path if current_user
  end

  def about
    @title = "About"
  end

end
