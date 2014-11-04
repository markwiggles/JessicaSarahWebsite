

  class PdfMailer < ActionMailer::Base


    default from: 'mail@jessicasarahmusic.com'


    def send_mail_to_debtor(debtor)

      # assign the settings, to be used here and in the contact_mailer
      # @settings = Settings.first
      # @contact = contact

      attachments['20141031staf.pdf'] = File.read('pdfs/20141031staf.pdf')

      @url = 'localhost:3000'

      mail(to: 'markwigg@live.com', subject: 'test')

    end

    def send_mail_copy_to_biller(biller)

      # @contact = contact

      # assign the settings, to be used in the contact_mailer

      mail(to: 'jessicasarahmusic@gmail.com', subject: 'Website Message')

    end


  end
