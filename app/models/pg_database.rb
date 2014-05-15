class PgDatabase < Database

  def delegate_create_to_backend
    db_info = Scli::Database.database_create
    self.hostname = db_info[:ip]
    self.save!
  end

  def delegate_destroy_to_backend

  end

  def db_url
    "postgres://docker:docker@#{self.hostname}/docker"
  end
end
