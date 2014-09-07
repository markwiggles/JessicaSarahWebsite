module FollowHelper

  require 'omniauth-twitter'

  def get_twitter_feed

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_OAUTH_TOKEN']
      config.access_token_secret = ENV['TWITTER_OAUTH_SECRET']
    end

    return client.user_timeline('jsarahmusic', count: 7).to_json

  end

end



# <?php
# session_start();
# require_once("oauth/twitteroauth.php"); //Path to twitteroauth library
#

#
#
#
# $twitteruser = "jsarahmusic";
# $notweets = 8;
# $consumerkey = TWITTER_CONSUMER_KEY;
# $consumersecret = TWITTER_CONSUMER_SECRET;
# $accesstoken = OAUTH_TOKEN;
# $accesstokensecret = OAUTH_SECRET;
#
# function getConnectionWithAccessToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
#   $connection = new TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
#   return $connection;
# }
#
# $connection = getConnectionWithAccessToken($consumerkey, $consumersecret, $accesstoken, $accesstokensecret);
#
# $tweets = $connection->get("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=".$twitteruser."&count=".$notweets);
#
# echo json_encode($tweets);
# ?>
