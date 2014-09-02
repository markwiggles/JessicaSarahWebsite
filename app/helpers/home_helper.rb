module HomeHelper


  PAGE_ID = 'jessicasarahmusic'

  ACCESS_TOKEN = "CAACEdEose0cBAGZALPtTmxtKC2ZBDpV1PlciWhG0UpXPXuk2FC0aIA3X1aclZAvb1J8HLsMghUErWk6OWIj6wAzdRqRSKbj1agSzKyHWx2FcwnduagZCAsmZAlSzYA7F2fKXHZCRpsWQpEcqsnXLvdXwAwxG3kY3Nw9bDhcPzxYG4GGgFRevrtJAZAIWl0OLiUFCgZAyCPKjsU76Uc52lLVu"


  def get_facebook_post

    @graph = Koala::Facebook::API.new(ACCESS_TOKEN)

    profile = @graph.get_connection('jessicasarahmusic', 'feed')

  end



end
