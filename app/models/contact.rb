class Contact < ActiveRecord::Base

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  FORBIDDEN = ['fuck', 'cunt', 'shit', 'crap']

  validates :message, :presence => true, :length => {:minimum => 20}
  validates :name, :presence => true, :length => {:minimum => 2}
  validates :email, :presence => true, :format => EMAIL_REGEX

  validate :check_bad_words


  private

  def check_bad_words

    if FORBIDDEN.include?(message)
    errors.add('please be nice')
    end

  end


end
