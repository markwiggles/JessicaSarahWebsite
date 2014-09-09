class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'default'

  before_filter 'assign_links'


  def assign_links

    @twitter = 'https://www.twitter.com/Jsarahmusic'
    @facebook = 'https://www.facebook.com/pages/Jess-Wigglesworth/304789669623158'
    @youtube = 'http://www.youtube.com/user/JessWigglesworth'
    @tumblr = 'http://www.jessicasarahmusic.tumblr.com/'
    @instagram = 'http://www.instagram.com/jessicasarahmusic/'

  end


end
