DeviseRolesUserManagement::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # upgrade to rails 3.1
  # http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#upgrading-from-rails-3-0-to-rails-3-1
  #config.action_view.debug_rjs            = true
  config.assets.compress                   = false
  config.assets.debug                      = true
  
  # upgrade to rails 3.2.2
  # http://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#upgrading-from-rails-3-1-to-rails-3-2
  # Raise exception on mass assignment protection for Active Record models
  
  # note -- commented out because we're using Mongoid, not activerecord
  # config.active_record.mass_assignment_sanitizer = :strict
   
  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  
  # note -- commented out because we're using Mongoid, not activerecord
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

end

