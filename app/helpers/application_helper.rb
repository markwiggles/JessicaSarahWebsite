module ApplicationHelper

# -----------------------------------------------------------------------
# Method to call flickr pics
  def get_flickr_pics (photoset)

    api_key = '0dd1537c46575cf8b7b2a2df94156fd9'
    method = 'flickr.photosets.getPhotos'
    format = 'json'

    #for testing
    user_id = '128529405@N05'
    photoset_id = '72157648179656437' #ladder pics

    base_url = 'https://api.flickr.com/services/rest/'

    response = RestClient.get base_url, {
        :params => {
            'api_key' => api_key,
            'photoset_id' => photoset,
            'method' => method,
            'format' => format,
            'nojsoncallback' => 1,
            'extras' => 'original_format'
        }
    }

    return response

  end

  def change_image_url_to_thumbnail(image_url)

    image_url = image_url.gsub('_m', '_s')
    image_url = image_url.gsub('_q', '_s')
    image_url.gsub('_n', '_s')

  end

  def add_select_message component
    "Select a #{component} &#xf078;".html_safe
  end


end
