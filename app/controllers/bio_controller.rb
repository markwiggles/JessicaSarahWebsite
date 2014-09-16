class BioController < ApplicationController



  def index

    @current_page = 'bio'

    # get the first record in the settings table
    @settings = Settings.first

  end
end
