require 'signet/oauth_2/client'

class GoogleApi
  attr_reader :token, :api_info, :code, :client_id, :client_secret
  attr_accessor :author

  def initialize(code)
    @client_id = Rails.application.secrets.client_id
    @client_secret =  Rails.application.secrets.client_secret
    @account_email  = Rails.application.secrets.account_email
    @code = code
    @token = get_token["access_token"]
    create_or_update
  end

  def get_author
    @author
  end

  def get_token
    client = Signet::OAuth2::Client.new(
      :token_credential_uri =>  'https://accounts.google.com/o/oauth2/token',
      :client_id => @client_id,
      :client_secret => @client_secret,
      :code => @code,
      :redirect_uri => "https://til-mw.herokuapp.com/"
    ).fetch_access_token!
  end

private

   def create_or_update
     api_info = HTTParty.get("https://www.googleapis.com/oauth2/v1/userinfo?access_token=#{token}")
     @author = Author.find_or_create_by(email: api_info["email"])
     @author.update_attributes(api_attributes(api_info))
   end

   def api_attributes(info)
     {
       email: info["email"]
     }
   end
end
