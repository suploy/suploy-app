class SshKey < ActiveRecord::Base
  validate :validate_key
  validates_presence_of :title
  validates_presence_of :content
  validates_uniqueness_of :title, scope: :user_id

  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend
  before_validation :set_fingerprint
  before_validation :remove_whitespaces

  belongs_to :user

  def remove_whitespaces
    self.content.strip!
  end

  def delegate_create_to_backend
    AddSshKeyWorker.perform_async(self.user.username, self.title, self.content)
  end

  def delegate_destroy_to_backend
    RemoveSshKeyWorker.perform_async(self.user.username, self.title)
  end

  def set_fingerprint
    self.fingerprint = SSHKey.fingerprint self.content
  end

  def validate_key
    if !valid_key?
      errors.add(:key, "is not a valid ssh public key")
    end
    if SshKey.find_by_fingerprint(self.fingerprint)
      errors.add(:key, "has already been added")
    end
  end

  def valid_key?
    SSHKey.valid_ssh_public_key? self.content
  end

  def to_param
    title
  end

  def self.find(title, user)
    user.ssh_keys.where(title: title).first
  end
end
