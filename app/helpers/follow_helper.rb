module FollowHelper




end


# <?php
# session_start();
# require_once("oauth/twitteroauth.php"); //Path to twitteroauth library
#
# define("TWITTER_CONSUMER_KEY", "r3NCOglTD3tF3q1ePfhlw");
# define("TWITTER_CONSUMER_SECRET", "S0juk6c230t7IRuVW8yxoQ35CGluZ0dB7Fg2ZsAiHs");
# define("OAUTH_TOKEN", "543781426-kB1f4p25kQs3TypRElUyAUAmSxSE199Z6YgVM1QC");
# define("OAUTH_SECRET", "IJZ1tl8vGEuwRdUTww5TRNAnLvzPQL9EFme9gjJYZeL46");
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
