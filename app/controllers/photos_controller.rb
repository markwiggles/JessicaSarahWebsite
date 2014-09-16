class PhotosController < ApplicationController

  def pics
    @current_page = 'pics'
  end

  def art
    @current_page = 'art'
  end

  def get_json_photos

    # assign the response by calling the helper method, passing in the photoset id
    @photos = view_context.get_flickr_pics(params[:photoset_id])
    render :text => @photos.to_json

  end

end
