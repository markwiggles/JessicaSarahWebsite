class ContactMailer < ActionMailer::Base


  default from: 'mail@jessicasarahmusic.com'


  def send_mail_to_contact(contact)

    # assign the settings, to be used here and in the contact_mailer
    @settings = Settings.first

    @contact = contact
    @url = 'localhost:3000'
    mail(to: @contact.email, subject: @settings.email_subject)

  end

  def send_mail_to_artist(contact)

    @contact = contact
    mail(to: 'jessicasarahmusic@gmail.com', subject: 'Website Message')

  end


end
