class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable and :omniauthable, :rememberable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :trackable, :validatable

  field :roles, type: Array, default: []

  validates_uniqueness_of :email, :case_sensitive => false

  attr_accessible :email, :password, :password_confirmation
  has_and_belongs_to_many :shared_episodes, class_name: "Episode"
  has_many :episodes, inverse_of: :owner, dependent: :destroy
end
