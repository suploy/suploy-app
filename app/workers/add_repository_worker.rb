class AddRepositoryWorker
  include Sidekiq::Worker

  def perform(app_user_name, app_name)
    scli_repo = Scli::Repo.new config.gitolite_dir, config.repo_dir
    scli_repo.add_repository(app_user_name, app_name)
  end

  def config
    Suploy.config.suploy
  end
end
