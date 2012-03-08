class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :trackable, :validatable

  field :roles, type: Array, default: []

  validates_uniqueness_of :email, :case_sensitive => false

  def viewable_episodes
    Episode.any_of({owner_id: self._id}, {user_ids: self._id})
  end

  def role?(role)
    self.roles.include? role
  end

  def role=(role)
    case role
    when Symbol
      self.roles = [role]
    when Array
      self.roles = role.map!(&:to_sym)
    else
      raise TypeError, "Argument must be a Symbol or Array of Symbols"
    end
  end

  attr_accessible :email, :password, :password_confirmation
  has_and_belongs_to_many :shared_episodes, class_name: "Episode"
  has_many :episodes, inverse_of: :owner, dependent: :destroy
end
