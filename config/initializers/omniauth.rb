Rails.application.config.middleware.use OmniAuth::Builder do	
    provider :twitter, ENV['eZHpmjVCOhmmwQSvGFopbOpwT'], ENV['2vqPUvvvGxWfQnjfTiBGDWMG2FNXHdexfXufMwFptvpOupF8rl']
end
