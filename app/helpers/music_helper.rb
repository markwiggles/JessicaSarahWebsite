module MusicHelper


  def get_video_images

    api_key = 'AIzaSyC_-oKFFF-sN44qM0KLP4dSDjibFUWs1HQ'
    playlistId = 'PLHwVhpfylJ4uOd9GavrgH6pfbtj01TC19'


    base_url = 'https://www.googleapis.com/youtube/v3/playlistItems'

    response = RestClient.get base_url, {
        :params => {
            part: 'snippet',
            playlistId: playlistId,
            key: api_key
        }
    }

    return response

  end



end
