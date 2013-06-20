KiindlyCom::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false


  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  #config.assets.compress = false

  # Expands the lines which load the assets
  #config.assets.debug = true

  # Silence the annoying sprockets log messages
  #config.assets.logger = false

  config.serve_static_assets = true

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  #config.action_mailer.delivery_method = :test
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'kiindly.com',
    :user_name            => 'donation@kiindly.com',
    :password             => 'd0n0rzz!',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
end

# OUAA test keys
#Stripe.api_key = "zdMlARuWbM3wUf8XLw37nVruppHdAaT9"
#STRIPE_PUBLISHABLE_KEY = "pk_3nMQqDSMnDAUB8PcYGP2PVTCSjrI5"

# CHI test keys
#Stripe.api_key = 'sk_0EEhFAMHd3BuQH29KJevoALr9zld1'
#STRIPE_PUBLISHABLE_KEY = 'pk_0EEh2ZN9GM4wWLGEAEznbIysBQ4te'

# LTS test keys
# id |        name        |      contact_name       |         contact_email          | contact_phone |       stripe_access_token        |         created_at         |
# |     updated_at         |                stripe_refresh_token
# 18 | LTS Chicago        | Mark Biery              | mark@livetosupport.com         | 5623550344    | sk_live_BrefMrBLxMUlOq0OVNbcqcHp | 2013-06-10 01:12:36.488557 | 20
# 13-06-10 01:12:36.488557 | rt_1zIQP7kRDzEr6pxfEGbjU3QQ3AZ94nRmGnFJ5cAWSXrKi517
# LIVE #
Stripe.api_key = 'sk_live_BrefMrBLxMUlOq0OVNbcqcHp'

# DEVELOPMENT #
STRIPE_PUBLISHABLE_KEY = 'pk_test_nF6pGtowUM7oGXQKUNG2AA0f'
STRIPE_CLIENT_ID_DEVELOPMENT = 'ca_1PeWkKK3FZct85SCAQDJlcBhwxLqBhMF'

