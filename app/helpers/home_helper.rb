module HomeHelper


  PAGE_ID = 'jessicasarahmusic'

  # ACCESS_TOKEN = 'CAACEdEose0cBAGZALPtTmxtKC2ZBDpV1PlciWhG0UpXPXuk2FC0aIA3X1aclZAvb1J8HLsMghUErWk6OWIj6wAzdRqRSKbj1agSzKyHWx2FcwnduagZCAsmZAlSzYA7F2fKXHZCRpsWQpEcqsnXLvdXwAwxG3kY3Nw9bDhcPzxYG4GGgFRevrtJAZAIWl0OLiUFCgZAyCPKjsU76Uc52lLVu'

  APP_ID = '1526063580959422'
  APP_SECRET = 'eb02266fe22902eab7811057d1f48b98'

  def get_facebook_post

    # # @graph = Koala::Facebook::API.new(ACCESS_TOKEN)
    # #
    # # profile = @graph.get_connection('jessicasarahmusic', 'feed')

    @oauth = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET)
    @user_info = @oauth.get_user_info_from_cookies(cookies)

    # return @user_info


  end

end

