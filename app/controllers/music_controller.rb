class MusicController < ApplicationController


  def tracks
    @current_page = 'tracks'
  end

  def video
    @current_page = 'video'
  end

  def get_video_thumbs
    # assign the response by calling the helper method
    @videos = view_context.get_video_images
    render :text => @videos.to_json
  end


end
