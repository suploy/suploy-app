class RecreateWithDbWorker
  include Sidekiq::Worker

  def perform(app_name, db_container_name)
    puts app_name
    puts db_container_name
    Scli::Container.create_app_container_with_db(app_name+"image", "", db_container_name)
  end
end
