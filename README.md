Installation
------------

### Git

	sudo apt-get install git-core
	sudo adduser --disabled-login --gecos 'suploy' git

### Setup user

	sudo adduser vagrant
	sudo su vagrant
	ssh-keygen
	git config --global user.name "suploy"
	git config --global user.email "suploy@suploy.com"
	exit

### Gitolite

	sudo -u git -H mkdir /home/git/bin
	sudo -u git -H mkdir /home/git/.ssh
	sudo cp /home/vagrant/.ssh/id_rsa.pub /home/git
	sudo chmod 0755 /home/git/id_rsa.pub
	sudo -u git -H git clone https://github.com/sitaramc/gitolite.git /home/git/gitolite
	sudo -u git -H /home/git/gitolite/install -to /home/git/bin
	sudo -u git -H /home/git/bin/gitolite setup -pk /home/git/id_rsa.pub

vim /home/git/.gitolite/hooks/common/post-receive
[post-receive](doc/config/post-receive)

### Buildstep

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\
	> /etc/apt/sources.list.d/docker.list"
	sudo apt-get update
	sudo apt-get install lxc-docker

	sudo -u git -H git clone https://github.com/progrium/buildstep.git /home/git/buildstep
	cd /home/git/buildstep
	sudo make build
	sudo gpasswd -a git docker
	sudo service docker restart

### Suploy Webapp

	git clone git@localhost:gitolite-admin
	git clone https://github.com/suploy/suploy-app.git /home/vagrant/suploy
	cd /home/vagrant/suploy
	git submodule init
	git submodule update
	sudo apt-get -y -q install gawk libgdbm-dev pkg-config libffi-dev build-essential openssl libreadline6 libreadline6-dev curl git zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev libncurses5-dev automake libtool bison subversion python postgresql postgresql-contrib libpq-dev redis-server python-software-properties
	curl -L https://get.rvm.io | bash -s stable
	source "/home/vagrant/.rvm/scripts/rvm"
	rvm install ruby-2.1.0
	gem install bundler
	bundle install
	rake db:create
	rake db:migrate
	rake db:seed
