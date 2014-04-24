class AddRepositoryWorker
  include Sidekiq::Worker

  def perform(app_user_name, app_name)
    $scli.add_repository(app_user_name, app_name)
  end
end
