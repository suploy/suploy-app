class SshKey < ActiveRecord::Base
  validate :validate_key
  validates_presence_of :title
  validates_presence_of :content

  before_save :set_fingerprint

  belongs_to :user

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
