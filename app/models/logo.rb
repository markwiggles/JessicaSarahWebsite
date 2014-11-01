class Logo < ActiveRecord::Base

  before_save :create_image_urls

  validates :name, :presence => {:message => '?'}


  scope :sorted_by_position_visible, lambda { where(:visible => true).order('position ASC') }

  scope :sorted_by_position_all, lambda { order('position ASC') }


  def create_image_urls
    # if self.image_size != 'none' && self.image_size != nil
    self.image_url = create_url nil #self.image_size
    # end
  end

  def default_image_id
    self.image_id ||= 'no_image'
  end


  def create_url (image_size)

    # associate the size with the required appendix
    # if image_size == 'medium'
    #   appendix = '_q.jpg'
    # elsif image_size == 'large'
    appendix = '_m.jpg'
    # else
    #   appendix = '_s.jpg'
    # end

    # revert back to the backslashed version (from the html safe version)
    image_id = self.image_id.gsub '-', '/'
    # create the url
    "http://farm#{image_id}#{appendix}".html_safe

  end # end create_image_url


end


