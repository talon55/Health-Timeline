class StaticController < ApplicationController
  def home
  end

  def about
  @title = "About"
  end

end
