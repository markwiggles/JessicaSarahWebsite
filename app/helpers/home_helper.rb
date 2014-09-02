module HomeHelper


  PAGE_ID = 'jessicasarahmusic'

  ACCESS_TOKEN = "CAACEdEose0cBAMMt7dDWfZCyQcoknEE5xgKNp3DyBgLmnYBIV9ZCYDuvcB8ZCiz2E6aBg44mgubXJTiXb8BtkN2A93LRQn8T2ZAQlDOHv5ZBZCZBLq9AnMwYyN0xEVNOhYZCH1KyYzEk7esp6RmiWBVPsIJ2H804ccBEWQ3JrRsly89wOzP5g7PWRWs7UQbe7YP2LWu9RetQWcfZAPnKZCciZAKuTTrGY55niMZD"


  def get_facebook_post

    @graph = Koala::Facebook::API.new(ACCESS_TOKEN)

    page = @graph.get_connection('jessicasarahmusic', 'statuses')




  end



end
