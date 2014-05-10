namespace :env do
  desc "Reset the environment to a fresh installation"
  task reset: :environment do
    ##Cleanup Webapp
    #Cleanup Webapp PGDatabase
    Rake::Task["db:drop"].invoke
    Rake::Task["db:setup"].invoke

    #Cleanup Redis
    `redis-cli FLUSHDB`

    ##Cleanup Gitolite
    #Cleanup SSH Keys
    ssh_keys_dir = '/home/vagrant/gitolite-admin/keydir'
    Dir.foreach(ssh_keys_dir) do |f| 
      fn = File.join(ssh_keys_dir, f)
      File.delete(fn) if f != '.' && f != '..' && f != 'id_rsa.pub'
    end

    #Cleanup gitolite.conf
    gitolite_conf = '/home/vagrant/gitolite-admin/conf/gitolite.conf'
    File.open(gitolite_conf, 'w') do |file|
      file.write "repo gitolite-admin\n    RW+     =   id_rsa\n\nrepo testing\n    RW+     =   @all"
    end

    #Push changes
    system 'cd /home/vagrant/gitolite-admin && git commit -a -m "auto commit" && git push'

    #Remove actual repositories
    git_repo_dir = '/home/git/repositories'
    `sudo ls /home/git/repositories`.split.each do |f| 
      system "sudo rm -rf #{git_repo_dir}/#{f}" if f != '.' && f != '..' && f != 'gitolite-admin.git' && f != 'testing.git'
    end

    ##Docker
    #Stop and remove all containers
    `sudo docker stop $(sudo docker ps -q)`
    `sudo docker rm $(sudo docker ps -a -q)`

    #Remove all images
    `sudo docker rmi $(sudo docker images -q)`
  end
end
