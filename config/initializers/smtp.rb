if Rails.env.production?

  Suploy::Application.config.action_mailer.default_url_options = { :host => Suploy.config.smtp.domain }
  Suploy::Application.config.mailer_sender = Suploy.config.email
  ActionMailer::Base.default_options = {
    :from => Suploy.config.email
  }

  if Suploy.config.smtp.enabled
    ActionMailer::Base.smtp_settings = {
      :port => Suploy.config.smtp.port,
      :address => Suploy.config.smtp.host,
      :user_name => Suploy.config.smtp.user,
      :password => Suploy.config.smtp.password,
      :domain => Suploy.config.smtp.domain,
      :authentication => :plain
    }
    ActionMailer::Base.delivery_method = :smtp
  else
    ActionMailer::Base.delivery_method = :sendmail
  end

end
