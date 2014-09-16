class HomeController < ApplicationController


  def index
    @home = true

    @current_page = 'home'

    # get the first record in the settings table
    @settings = Settings.first

  end



end
