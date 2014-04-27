class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  validate :internal_name, uniqueness: true
  validate :name, uniqueness: true

  def users_count
    self.users.count
  end
end
