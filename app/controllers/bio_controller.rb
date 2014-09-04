class BioController < ApplicationController



  def index

    # get the first record in the settings table
    @settings = Settings.first

  end
end
