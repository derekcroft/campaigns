class AccessToken
  attr_reader :client

  def initialize(stripe_account_holder = 'kiindly', mode = 'test')
    @stripe_account_holder = stripe_account_holder
    @client_id = stripe_config["client_id"][Rails.env]
    @secret_api_key = stripe_config["api_key"][stripe_account_holder]["secret"][mode]
    @options = {
      site: 'https://connect.stripe.com',
      authorize_url: '/oauth/authorize',
      token_url: '/oauth/token'
    }
  end

  def stripe_config
    @stripe_config ||= YAML.load(File.read(File.join('config', 'stripe.yml')))
  end

  def client(code)
    @client = OAuth2::Client.new(@client_id, @secret_api_key, @options)
  end

  def fetch!(authorization_code)
    client.auth_code.get_token(params: { scope: 'read_write' } )
  end

  def refresh!(refresh_code = nil)
    refresh_code ||= stripe_config["api_key"][@stripe_account_holder]["refresh"]
    @access_token = OAuth2::AccessToken.new(client, refresh_code)
    @access_token.refresh_token = refresh_code
    @access_token.refresh!
  end
end
