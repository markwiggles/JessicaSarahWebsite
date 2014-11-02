module Account

  class InvoicesController < ApplicationController

    layout 'cerulean'

    def index
      @date = Date.today.strftime('%B %d %Y')
      @invoice = Invoice.new
      @billers = Biller.all
      @debtors = Debtor.all
      @items = Item.all
      @descriptions = Description.all
      @bank_details = BankDetail.all
      @logos = Logo.all
    end

    # -----------------------------------------------
    # SHOW

    def show

      @invoice = Invoice.find_by_id 6
      @debtor= Debtor.find_by_id @invoice.debtor_id

      @date = Date.today.strftime('%B %d %Y')

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'test', # file name
                 template: 'account/invoices/show.pdf.erb',
                 layout: 'wicked.pdf.erb', # layout used
                 show_as_html: params[:debug].present? # allow debuging
        end
      end
    end

    # -----------------------------------------------
    # CREATE
    def new
      @invoice = Invoice.new
    end

    def create
      @invoice = Invoice.new(invoice_params)

      if @invoice.save
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
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
          format.html {redirect_to account_settings_path}
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
    end# -------------------------------------------------------------------------
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
          :debtor_id,
          :logo_id
      )
    end
  # -----------------------------------------------



  end
end