class Episode
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :family_name, :type => String
  field :given_name, :type => String

  #validations go here

  def name

  end

  #model relations go here
end
