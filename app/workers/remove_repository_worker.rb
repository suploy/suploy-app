class RemoveRepositoryWorker
  include Sidekiq::Worker

  def perform(app_name)
    scli_repo = Scli::Repo.new config.gitolite_dir, config.repo_dir
    scli_repo.remove_repository(app_name)
  end

  def config
    Suploy.config.suploy
  end
end
