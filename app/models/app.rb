class App < ActiveRecord::Base
  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend

  belongs_to :user
  has_many :databases

  validates :name, presence: true, uniqueness: true, length: { within: 0..255 },
            format: { with: /\A[a-zA-Z0-9_][a-zA-Z0-9_\-\.]*\z/,
                      message: "only letters, digits, spaces & '_' '-' '.' allowed. Letter or digit should be first" }

  def delegate_create_to_backend
    AddRepositoryWorker.perform_async(self.user.username, self.name)
  end

  def delegate_destroy_to_backend
    RemoveRepositoryWorker.perform_async(self.name)
  end

  def repository
    "git@#{Suploy.config.host}:#{self.name}"
  end

  def ensure_pg_db
    if self.databases.empty?
      self.databases << Database.create
    end
  end
end
