module Account

  class InvoiceNumbersController < ApplicationController

    # -----------------------------------------------
    # CREATE
    def new
      @invoice_number = InvoiceNumber.new
    end

    def create
      @invoice_number = InvoiceNumber.new(invoice_number_params)

      if @invoice_number.save
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
      end
    end
    # -----------------------------------------------
    # UPDATE
    def edit
      @invoice_number = InvoiceNumber.find params[:id]
    end

    def update
      @invoice_number = InvoiceNumber.find params[:id]
      if @invoice_number.update_attributes invoice_number_params
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
      end
    end
    # -----------------------------------------------
    # DELETE
    def delete
      @invoice_number = InvoiceNumber.find params[:id]
    end

    def destroy
      @invoice_number = InvoiceNumber.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to account_settings_path }
        format.js
      end
    end

    # -----------------------------------------------
    def invoice_number_params

      params.require(:invoice_number).permit(
          :name,
          :date,
          :seq_number,
          :identifier,
          :invoice_number,
          :inovices_id
      )
    end
  end
  # -----------------------------------------------

end