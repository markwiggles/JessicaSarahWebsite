class HomeController < ApplicationController


  def index
    @home = true
  end


  def get_facebook_stuff

    # assign the response by calling the helper method
    @facebook = view_context.get_facebook_post()
    render :text => @facebook.to_json

  end


end
