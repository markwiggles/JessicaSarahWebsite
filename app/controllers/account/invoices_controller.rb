module Account

  class InvoicesController < ApplicationController

    layout 'cerulean'

    def index
      @invoice = Invoice.new
      assign_components
    end

    # -----------------------------------------------
    # SHOW

    def show
      assign_show_components

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: @invoice_number, # file name
                 template: 'account/invoices/show_pdf.html.erb',
                 layout: 'wicked.pdf.erb', # layout used
                 show_as_html: params[:debug].present?, # allow debuging
                 save_to_file: Rails.root.join('pdfs', "#{@invoice_number}.pdf")
        end
      end
    end

    def mail_pdf

      logger.debug "MAILING #{}"

      respond_to do |format|
        format.js
        format.html { redirect_to account_settings_path }
      end

      PdfMailer.send_mail_to_debtor(params[:invoice]).deliver

    end

    # -----------------------------------------------
    # CREATE
    def new
      @invoice = Invoice.new
    end

    def create
      @invoice = Invoice.new(invoice_params)
      assign_components

      if @invoice.save

        # send to page which will render pdf in iframe
        last_id = Invoice.last.id
        render :js => "window.location = '#{account_invoice_path(last_id)}'"

      else
        render('new')
      end

    end


    # -----------------------------------------------
    # UPDATE
    def edit
      @invoice = Invoice.find params[:id]
    end

    def update
      @invoice = Invoice.find params[:id]
      if @invoice.update_attributes invoice_params
        respond_to do |format|
          format.html { redirect_to account_settings_path }
          format.js
        end
      end
    end

    # -----------------------------------------------
    # DELETE
    def delete
      @invoice = Invoice.find params[:id]
    end

    def destroy
      @invoice = Invoice.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to account_settings_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------
    # REFRESH THE IMAGE

    def refresh_image
      @logo = Logo.find params[:id]

      respond_to do |format|
        format.html { redirect_to account_invoices_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------
    # REFRESH THE BILLER

    def refresh_biller
      @biller = Biller.find params[:id]

      respond_to do |format|
        format.html { redirect_to account_invoices_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------
    # REFRESH THE DEBTOR

    def refresh_debtor
      @debtor = Debtor.find params[:id]

      respond_to do |format|
        format.html { redirect_to account_invoices_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------
    # REFRESH THE BANK DETAILS

    def refresh_bank_details
      @bank_detail = BankDetail.find params[:id]

      respond_to do |format|
        format.html { redirect_to account_invoices_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------
    def invoice_params

      params.require(:invoice).permit(
          :date,
          :invoice_number,
          :amount,
          :gst,
          :description_id,
          :item_id,
          :biller_id,
          :debtor_id,
          :logo_id,
          :bank_detail_id
      )
    end

    # -----------------------------------------------

    def assign_components
      @date = Date.today.strftime('%B %d %Y')
      @billers = Biller.all
      @debtors = Debtor.all
      @items = Item.all
      @descriptions = Description.all
      @bank_details = BankDetail.all
      @logos = Logo.all
    end

    # -----------------------------------------------

    def assign_show_components

      @invoice = Invoice.find_by_id params[:id]
      @billers = Biller.find_by_id @invoice.biller_id
      @debtors = Debtor.find_by_id @invoice.debtor_id
      @items = Item.find_by_id @invoice.item_id
      @descriptions = Description.find_by @invoice.description_id
      @bank_details = BankDetail.find_by @invoice.bank_detail_id
      @logos = Logo.find_by @invoice.logo_id
      @invoice_number = @invoice.invoice_number

    end

  end
end