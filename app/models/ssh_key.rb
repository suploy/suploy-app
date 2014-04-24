class SshKey < ActiveRecord::Base
  validate :validate_key
  validates_presence_of :title
  validates_presence_of :content

  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend
  before_save :set_fingerprint

  belongs_to :user

  def delegate_create_to_backend
    AddSshKeyWorker.perform_async(self.user.name, self.title, self.content)
  end

  def delegate_destroy_to_backend
    RemoveSshKeyWorker.perform_async(self.user.name, self.title)
  end

  def set_fingerprint
    self.fingerprint = SSHKey.fingerprint self.content
  end

  def validate_key
    if !valid_key?
      errors.add(:key, "is not a valid ssh public key")
    end
  end

  def valid_key?
    SSHKey.valid_ssh_public_key? self.content
  end

end
