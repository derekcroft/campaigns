class AccessToken
  def fetch!(authorization_code)
    client.auth_code.get_token(params: { scope: 'read_write' } )
  end

  def self.stripe_config
    @@stripe_config ||= YAML.load(File.read(File.join('config', 'stripe.yml')))
  end

  def self.stripe_mode_for(stripe_account_holder)
    mode = stripe_config["api_key"][stripe_account_holder]["mode"]
    return mode if %w{live test}.include?(mode)
    raise "Stripe mode be defined as 'live' or 'test' for #{stripe_account_holder} in stripe.yml"
  end

  def self.oauth_client(stripe_account_holder, mode)
    client_id = stripe_config["client_id"][Rails.env]
    secret_api_key = stripe_config["api_key"]["kiindly"]["secret"][mode]
    options = {
      site: 'https://connect.stripe.com',
      authorize_url: '/oauth/authorize',
      token_url: '/oauth/token'
    }
    OAuth2::Client.new(client_id, secret_api_key, options)
  end

  def self.refresh!(stripe_account_holder, mode)
    refresh_code = stripe_config["api_key"][stripe_account_holder]["refresh"]
    client = oauth_client(stripe_account_holder, mode)
    access_token = OAuth2::AccessToken.new(client, refresh_code)
    access_token.refresh_token = refresh_code
    access_token.refresh!
  end
end
