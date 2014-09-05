class AdminController < ApplicationController

  def index

    @current_settings = Settings.first

    @settings = Settings.new

  end

  def update_website

    @settings = Settings.first
    if @settings.update_attributes(website_params)
      flash[:notice] = 'website updated'
      redirect_to(:home)
    else
      render('admin')
    end

  end

  def website_params
    params.require(:settings).permit(
        :bio1,
        :bio2
    )
  end

end
