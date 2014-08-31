class PhotosController < ApplicationController

  def pics
  end

  def get_json_photos

    # assign the response by calling the helper method, passing in the photoset id
    @photos = view_context.getFlickrPics(params[:photoset_id])
    render :text => @photos.to_json

  end

end
