class Episode
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :family_name, :type => String
  field :given_name, :type => String

  #validations go here

  def name
    [self.given_name, self.family_name].join(' ').chomp(' ')
  end

  #model relations go here
  has_and_belongs_to_many :users, inverse_of: :shared_episodes
  belongs_to :owner, class_name: "User"
end
