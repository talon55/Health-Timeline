class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :trackable, :validatable

  field :roles, type: Array, default: []
  field :user_share_ids, type: Array, default: []

  validates_uniqueness_of :email, :case_sensitive => false

  def shared_users
    User.any_in(_id: self.user_share_ids)
  end

  def share_with users, top = true # I totally over-engineered this method
    case users
    when User
      self.user_share_ids << users.id
    when BSON::ObjectId
      self.user_share_ids << users
    when String
      self.user_share_ids << BSON::ObjectId.from_string(users) if BSON::ObjectId.legal? users
    when Array
      users.each do |user|
        self.share_with user, false
      end
    end

    if top
      self.user_share_ids.uniq!
      self.save!
    end
  end

  # only works with BSON::ObjectId, a User object, or an Array of BSON::ObjectId
  # consider making this more robust in the future
  def stop_sharing_with users
    case users
    when Array
      self.user_share_ids.reject! {|id| users.include? id}
    else
      self.user_share_ids.reject! {|id| id == users or id == users.try(:id)}
    end
    self.save!
  end

  def viewable_episodes
    Episode.any_of({owner_id: self.id}, {user_ids: self.id})
  end

  def role?(role)
    self.roles.include? role
  end

  def role=(role)
    case role
    when String
      self.roles = [role.to_sym]
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
