require 'twitter'

TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key = 'P0nIk6X8jIylvRXPBOaqK0MtI'
  config.consumer_secret = '1zvoPMKW1hhdNzjnQ1UPqyoKLNNdvpbeEmU3STDT2xvV36lfbN'
  config.access_token = '590893624-FyTCNjF89ZSTeILrmJm332fqMiQXevAfsk29LUjO'
  config.access_token_secret = 'TGHzukOP4IskbmzocFwrQU1UMublbRZV6gM7pdK4cMM4D'
end

#юзфул линк
# https://dev.twitter.com/docs/platform-objects/tweets