class AddSshKeyWorker
  include Sidekiq::Worker

  def perform(ssh_key_user_name, ssh_key_title, ssh_key_content)
    scli_ssh = Scli::ScliSSHKey.new Suploy.config.suploy.gitolite_dir
    scli_ssh.add_ssh_key(ssh_key_user_name, ssh_key_title, ssh_key_content)
  end
end
