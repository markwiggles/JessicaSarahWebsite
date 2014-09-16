class AdminController < ApplicationController

  layout 'admin'

  before_filter :authenticate_user!

  def index

    @current_page = 'admin'

  end

  def bio_update
    @current_page = 'bio-update'
    initialize_settings
  end

  def update_bio
    @settings = Settings.first
    if @settings.update_attributes(website_params)
      flash[:notice] = 'bio updated'
      redirect_to(:controller => 'admin', :action => 'bio_update')
    else
      render('admin/bio_update')
    end
  end

  def news_update
    @current_page = 'news-update'
    initialize_settings
  end

  def update_news
    @settings = Settings.first
    if @settings.update_attributes(website_params)
      flash[:notice] = 'news updated'
      redirect_to(:controller => 'admin', :action => 'news_update')
    else
      render('admin/news_update')
    end
  end

  def email_update
    @current_page = 'email-update'
    initialize_settings
    @emails = Contact.sorted
    logger.debug(@emails)
  end

  def update_email
    @settings = Settings.first
    if @settings.update_attributes(website_params)
      flash[:notice] = 'email updated'
      redirect_to(:controller => 'admin', :action => 'email_update')
    else
      render('admin/email_update')
    end
  end


  private

  def website_params
    params.require(:settings).permit(
        :bio1,
        :bio2,
        :twitter_count,
        :facebook_post,
        :email_subject,
        :email_heading,
        :email_greeting,
        :email_body,
        :email_signature
    )
  end

  def initialize_settings
    @current_settings = Settings.first
    @settings = Settings.new
  end

end
