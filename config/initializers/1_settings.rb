class Settings < Settingslogic
  if File.exist?("#{Rails.root}/config/config.yml")
    source "#{Rails.root}/config/config.yml"
  else
    source "#{Rails.root}/config/config.yml.example"

    Settings['host'] = "suploy.com"
    Settings['email'] = "noreply@#{Settings.host}"

    Settings['suploy'] = Settingslogic.new({})
    Settings.suploy['gitolite_dir'] = '/home/vagrant/gitolite-admin'
    Settings.suploy['repo_dir'] = '/home/git/repositories'

    Settings['smtp'] = Settingslogic.new({})
    Settings.smtp['enabled'] = false
    Settings.smtp['domain'] = Settings.host
  end
  namespace Rails.env
end

Settings['redis'] ||= Settingslogic.new({})
Settings.redis['url'] ||= ENV["REDISTOGO_URL"]

Settings['suploy'] ||= Settingslogic.new({})
Settings.suploy['gitolite_dir'] ||= '/home/vagrant/gitolite-admin'
Settings.suploy['repo_dir'] ||= '/home/git/repositories'

Settings['omniauth'] ||= Settingslogic.new({})
Settings.omniauth['enabled'] ||= false
