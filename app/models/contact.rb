class Contact < ActiveRecord::Base

  scope :sorted, lambda {order('contacts.created_at DESC')}


  EMAIL_REGEX = /\A\S+@\S+\.\S+|z/


  validates :message, :length => {:minimum => 3, :message => '? ?'}
  validates :name, :presence => true, :length => {:minimum => 2, message: 'too short'}
  validates :email, :presence => true, :format => EMAIL_REGEX


  # validate :check_bad_words




  def send_contact_mail
    ContactMailer.send_mail_to_contact(self).deliver
  end

  def send_artist_mail
    ContactMailer.send_mail_to_artist(self).deliver
  end



  private

  def check_bad_words
    if FORBIDDEN.include?(message)
    errors.add('please be nice')
    end

  end


end
