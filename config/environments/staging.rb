KiindlyCom::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  #config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w{
    campaigns.js
    pledges.js
    pinit.js
    google_analytics.js
    mcColorPicker/mcColorPicker.js
    mcColorPicker/mcColorPicker.css
    popups.css
    popup.js
    jquery.js
  }

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  config.action_mailer.perform_deliveries = true
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

# OUAA live keys
#Stripe.api_key = "elub5pMJiQpkTknxOK50HCiSs3opsBDz"
#STRIPE_PUBLISHABLE_KEY = "pk_goE4UBY5zWbD39T98Y9vrfTJqdvN4"

# CHI live keys
#Stripe.api_key = 'sk_0EEhccEW3E48nB1fklAaKFBnGNKdL'
#STRIPE_PUBLISHABLE_KEY = 'pk_0EEhPDdlHd0gfqe8Yy1h2RhzSgmGw'

# CHI test keys
Stripe.api_key = 'sk_0EEhFAMHd3BuQH29KJevoALr9zld1'
STRIPE_PUBLISHABLE_KEY = 'pk_0EEh2ZN9GM4wWLGEAEznbIysBQ4te'
