class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def client

    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = "eZHpmjVCOhmmwQSvGFopbOpwT"
      config.consumer_secret = "2vqPUvvvGxWfQnjfTiBGDWMG2FNXHdexfXufMwFptvpOupF8rl"
      config.oauth_token = "10914232-l8K00T673ML3EjEGPpXorOOVIx5pMWa3aW4KKNbUK"
      config.oauth_token_secret = "o198WS4Hs9LVigz3zlfuSnIJlm1oOUCdzRs1vjdkeOps0"

##Tumblr.configure do |config|
  @client ||= Tumblr::REST::Client.new do |config|
  config.consumer_key = "consumer_key"
  config.consumer_secret = "consumer_secret"
  config.oauth_token = "access_token"
  config.oauth_token_secret = "access_token_secret"
end

    end
  end
end
