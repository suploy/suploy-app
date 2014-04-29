class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable, :lockable, :omniauthable,
    :authentication_keys => [:login]

  has_many :ssh_keys
  has_many :apps

  validates :username, uniqueness: {
    case_sensitive: false
  }

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_for_github_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create( username: data["nickname"],
                          email: data["email"],
                          provider: access_token.provider,
                          uid: access_token.uid,
                          password: Devise.friendly_token[0,20],
                          confirmed_at: Time.now
                        )
    end
    user
  end

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
