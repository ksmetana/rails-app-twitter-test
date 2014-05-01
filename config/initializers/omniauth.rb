Rails.application.config.middleware.use OmniAuth::Builder do	
    provider :twitter, "eZHpmjVCOhmmwQSvGFopbOpwT", "2vqPUvvvGxWfQnjfTiBGDWMG2FNXHdexfXufMwFptvpOupF8rl"
    provider :tumblr, "JHFAMnT4kmNgKMt6KqecGodzikTJoWOx9Oz0DXbU2ck37VKxlD", "F6tJWACBpP2NL2qv4LgmcVw9gR5TfTTmFqB6hO0B4rqKHbUoLH"
end
