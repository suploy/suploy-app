class App < ActiveRecord::Base
  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend

  belongs_to :user
  has_one :database
  has_many :envs

  validates :name, presence: true, uniqueness: true, length: { within: 0..255 },
            format: { with: /\A[a-zA-Z0-9_][a-zA-Z0-9_\-\.]*\z/,
                      message: "only letters, digits, spaces & '_' '-' '.' allowed. Letter or digit should be first" }

  def delegate_create_to_backend
    AddRepositoryWorker.perform_async(self.user.username, self.name)
  end

  def delegate_destroy_to_backend
    RemoveRepositoryWorker.perform_async(self.name)
  end

  def recreate_with_db(db_container_name)
    RecreateWithDbWorker.perform_async(self.name, db_container_name)
  end

  def repository
    "git@#{Suploy.config.host}:#{self.name}"
  end

  def status
    if Scli::Container.new.view_container(name)["State"]["Running"]
      :running
    else
      :not_running
    end
  rescue
    :not_deployed
  end

  def start
    Scli::Container.new.start_container name
  end

  def stop
    Scli::Container.new.stop_container name
  end

  def ensure_pg_db
    if self.database.nil?
      db = PgDatabase.new
      db.app = self
      db.save!
      self.database = db
    end
  end

  def to_param
    name
  end

  def self.find(input)
    app = find_by_name(input)
    if app.nil?
      raise ActiveRecord::RecordNotFound
    end
    app
  end
end
