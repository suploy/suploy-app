This project is no longer maintained/developed by the core team. If you would like to continue development, contact us.

Installation
------------

[![Build Status](https://travis-ci.org/suploy/suploy-app.svg?branch=master)](https://travis-ci.org/suploy/suploy-app)
[![Coverage Status](https://coveralls.io/repos/suploy/suploy-app/badge.png?branch=master)](https://coveralls.io/r/suploy/suploy-app?branch=master)
[![Code Climate](https://codeclimate.com/github/suploy/suploy-app.png)](https://codeclimate.com/github/suploy/suploy-app)

Suploy currently only supports Ubuntu 14.04.

### Git

	sudo apt-get install -y -q git-core
	sudo adduser --disabled-login --gecos 'suploy' git

### Setup user

	sudo -u git -H ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
	sudo -u git -H git config --global user.name "suploy"
	sudo -u git -H git config --global user.email "suploy@suploy.com"

### Gitolite

	sudo -u git -H mkdir /home/git/bin
	sudo -u git -H mkdir /home/git/.ssh
	sudo cp /home/git/.ssh/id_rsa.pub /home/git
	sudo chmod 0755 /home/git/id_rsa.pub
	sudo -u git -H git clone https://github.com/sitaramc/gitolite.git /home/git/gitolite
	sudo -u git -H /home/git/gitolite/install -to /home/git/bin
	sudo -u git -H /home/git/bin/gitolite setup -pk /home/git/id_rsa.pub
	sudo -u git -H wget -P /home/git/.gitolite/hooks/common/ https://raw.githubusercontent.com/suploy/suploy-app/master/doc/config/post-receive
	sudo -u git -H chmod 755 /home/git/.gitolite/hooks/common/post-receive

### Buildstep

	sudo apt-get update
	sudo apt-get install -y -q docker.io build-essential
	sudo ln -s /usr/bin/docker.io /usr/bin/docker
	sudo -u git -H git clone https://github.com/progrium/buildstep.git /home/git/buildstep
	cd /home/git/buildstep
	sudo make build
	sudo gpasswd -a git docker
	sudo gpasswd -a vagrant docker
	sudo docker pull zumbrunnen/postgresql
	sudo service docker.io restart

### Suploy Webapp

#### Install requirements and create database user

	echo -e "Host localhost\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
	git clone git@localhost:gitolite-admin /home/vagrant/gitolite-admin
	sudo apt-get -y -q install gawk libgdbm-dev pkg-config libffi-dev build-essential openssl libreadline6 libreadline6-dev curl git zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libc6-dev libncurses5-dev libicu-dev automake libtool bison subversion python postgresql postgresql-contrib libpq-dev redis-server python-software-properties
	curl -L https://get.rvm.io | bash -s stable
	source "/home/vagrant/.bash_profile"
	rvm install ruby-2.1.1
	gem install bundler
	sudo -u postgres psql -U postgres -d postgres -c "CREATE USER suploy WITH PASSWORD 'password1' CREATEDB;"

#### Install suploy, required gems and setup database

	git clone https://github.com/suploy/suploy-app.git /home/vagrant/suploy
	cd /home/vagrant/suploy
	git submodule init
	git submodule update
	bundle install
	rake db:setup
