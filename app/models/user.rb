class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable

  has_many :ssh_keys
  has_many :apps

  validates :name, uniqueness: true

  def self.find_for_github_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create( email: data["email"],
                          provider: access_token.provider,
                          uid: access_token.uid,
                          password: Devise.friendly_token[0,20],
                        )
    end
    user
  end

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
