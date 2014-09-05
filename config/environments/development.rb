Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false


  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = false



  config.action_mailer.default_url_options = {:host => 'localhost:3000'}


  #SMTP settings
  # config.action_mailer.default_url_options = {:host => 'localhost:3000'}
  #
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #     :address => 'smtp.gmail.com',
  #     :port => 587,
  #     :domain => 'localhost:3000',
  #     :user_name => 'markbwigglesworth02@gmail.com',
  #     :password => 'ripone101',
  #     :authentication => :plain,
  #     :enable_starttls_auto => true
  # }
  # Don't care if the mailer can't send
  # config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin


  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Set to :debug to see everything in the log.
  config.log_level = :debug

  config.quiet_assets = true


end
