class HomeController < ApplicationController


  def index
    @home = true

    # get the first record in the settings table
    @settings = Settings.first
  end



end
