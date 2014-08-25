class HomeController < ApplicationController


  def index
    @home = true
  end

  def user_login

    render('user_login')

  end
end
