module Account

  class InvoicesController < ApplicationController

    layout 'cerulean'

    def index
      @date = Date.today.strftime('%B %d %Y')
      @invoice = Invoice.new
      @billers = Biller.all
      @biller_first = Biller.first
      @debtors = Debtor.all
      @debtor_first = Debtor.first
      @items = Item.all
      @item_first = Item.first
      @descriptions = Description.all
      @description_first = Description.first
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

    # -----------------------------------------------
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