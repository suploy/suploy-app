class App < ActiveRecord::Base
  after_create :delegate_create_to_backend
  after_destroy :delegate_destroy_to_backend

  belongs_to :user

  def delegate_create_to_backend
    require './lib/suploy-scli/lib/scli'
    scli = Scli.new([], Kernel)
    scli.git_repo_url = './../gitolite-admin'
    scli.conffile = scli.git_repo_url + '/conf/gitolite.conf'
    scli.add_repository(self.user.name, self.name)
    scli.push_git_repo
  end

  def delegate_destroy_to_backend
    require './lib/suploy-scli/lib/scli'
    scli = Scli.new([], Kernel)
    scli.git_repo_url = './../gitolite-admin'
    scli.conffile = scli.git_repo_url + '/conf/gitolite.conf'
    scli.remove_repository(self.name)
    scli.push_git_repo
  end
end
