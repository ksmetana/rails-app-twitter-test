class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['eZHpmjVCOhmmwQSvGFopbOpwT']
      config.consumer_secret = ENV['2vqPUvvvGxWfQnjfTiBGDWMG2FNXHdexfXufMwFptvpOupF8rl']
      config.oauth_token = session['10914232-U3p9i9XJ0c4szCjkuFs6YVQqU1K7X6VkKt8fcbtvK']
      config.oauth_token_secret = session['o198WS4Hs9LVigz3zlfuSnIJlm1oOUCdzRs1vjdkeOps0']
    end
  end
end
