

  class PdfMailer < ActionMailer::Base


    default from: 'mail@jessicasarahmusic.com'


    def send_mail_to_debtor(invoice)

      # assign the settings, to be used here and in the contact_mailer
      # @settings = Settings.first
      # @contact = contact

      attachments["#{invoice}.pdf"] = File.read("pdfs/#{invoice}.pdf")

      @url = 'localhost:3000'

      mail(to: 'markwigg@live.com', subject: "Invoice: #{invoice}.pdf")

    end



    def send_mail_copy_to_biller(biller)

      # @contact = contact

      # assign the settings, to be used in the contact_mailer

      mail(to: 'jessicasarahmusic@gmail.com', subject: 'Invoice Sent')

    end


  end
