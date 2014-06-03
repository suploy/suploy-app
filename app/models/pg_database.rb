class PgDatabase < Database

  def delegate_create_to_backend
    connection_info = Scli::Database::database_create
    self.container_id = connection_info[:id]
    self.ip = connection_info[:ip]
    self.connection_url = connection_info[:connection_url]
    container_info = Scli::Container.view_container(self.container_id)
    self.app.recreate_with_db(container_info['Name'].gsub(/[^0-9A-Za-z_]/, ''))
  end

  def delegate_destroy_to_backend

  end
end
