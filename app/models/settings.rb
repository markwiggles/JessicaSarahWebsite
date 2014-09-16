class Settings < ActiveRecord::Base


  before_save :changePostSize


  :facebook_post




  def changePostSize

    self.facebook_post = self.facebook_post.gsub('data-width="466"', 'data-width="350"')

  end



end
