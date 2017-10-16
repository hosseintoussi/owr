Owa.configure do |config|
  config.api_url= ENV["OWM_API_URL"]
  config.appid = ENV["OWM_APP_ID"]
end
