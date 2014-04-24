class RemoveRepositoryWorker
  include Sidekiq::Worker

  def perform(app_name)
    $scli.remove_repository(app_name)
  end
end
