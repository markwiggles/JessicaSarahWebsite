module PhotosHelper

  require 'rest_client'


  def get_flickr_pics (photoset)

    api_key = '4e838758bdbdc042d2a2f15c319de851'
    method = 'flickr.photosets.getPhotos'
    format = 'json'

    #for testing
    user_id = '114761797@N03'
    photoset_id = '72157642276492534' #dinosaurs

    base_url = 'https://api.flickr.com/services/rest/'

    response = RestClient.get base_url, {
        :params => {
            'api_key' => api_key,
            'photoset_id' => photoset,
            'method' => method,
            'format' => format,
            'nojsoncallback' => 1
        }

    }
    return response

  end
end
