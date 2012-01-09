module StaticHelper

  def title
    base_title = "MedLog"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
end
