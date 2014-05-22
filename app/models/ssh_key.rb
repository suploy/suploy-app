class SshKey < ActiveRecord::Base
  validate :validate_key
  validates_presence_of :title
  validates_presence_of :content
  validates_uniqueness_of :title, scope: :user_id

  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend
  before_validation :set_fingerprint, if: :valid_key?
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
    self.fingerprint = SSHKey.fingerprint(content)
  end

  def validate_key
    if !valid_key?
      errors.add(:key, "is not a valid ssh public key")
    end
    if fingerprint && SshKey.find_by_fingerprint(fingerprint)
      errors.add(:key, "has already been added")
    end
  end

  def valid_key?
    content && SSHKey.valid_ssh_public_key?(content)
  end

  def to_param
    title
  end

  def self.find(title, user)
    ssh_key = user.ssh_keys.where(title: title).first
    if ssh_key.nil?
      raise ActiveRecord::RecordNotFound
    end
  end
end
