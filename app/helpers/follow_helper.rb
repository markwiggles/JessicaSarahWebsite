module FollowHelper

  require 'omniauth-twitter'

  def get_twitter_feed

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_OAUTH_TOKEN']
      config.access_token_secret = ENV['TWITTER_OAUTH_SECRET']
    end


    return client.user_timeline('jsarahmusic', count: Settings.first.twitter_count).to_json

  end

end


