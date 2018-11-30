class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable
  before_save{email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_many :ratings, dependent: :destroy
  has_many :rating_product, through: :ratings, source: :product
  has_many :comments
  has_many :orders, dependent: :destroy
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true
  # has_secure_password
  enum role: {customer: 0, admin: 1}
  scope :pick_by_email, ->(email){where("email = ?", email)}

  # using oauth2
  def self.from_omniauth access_token
    data = access_token.info
    user = User.pick_by_email(data["email"]).first
    return if user
    User.create name: data["name"],
      email: data["email"], password: Devise.friendly_token[0, 20]
  end

  # end using oauth2

  def self.digest string
    cost =  if ActiveModel::SecurePassword.min_cost
              BCrypt::Engine::MIN_COST
            else
              BCrypt::Engine.cost
            end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
