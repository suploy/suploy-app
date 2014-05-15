class RemoveSshKeyWorker
  include Sidekiq::Worker

  def perform(ssh_key_user_name, ssh_key_title)
    scli_ssh = Scli::ScliSSHKey.new Suploy.config.suploy.gitolite_dir
    scli_ssh.remove_ssh_key(ssh_key_user_name, ssh_key_title)
  end
end
