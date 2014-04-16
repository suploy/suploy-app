$scli = Scli.new([], Kernel)
$scli.git_repo_url = './../gitolite-admin'
$scli.conffile = $scli.git_repo_url + '/conf/gitolite.conf'
$scli.keydir = $scli.git_repo_url + '/keydir'
