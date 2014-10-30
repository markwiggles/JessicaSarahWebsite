module Account

  class SettingsController < ApplicationController

    layout 'cyborg'

    def index
      @billers = Biller.all
      @debtors = Debtor.all
      @items = Item.all
      @descriptions = Description.all
      @bank_details = BankDetail.all

    end

    # -------------------------------------------------------------------------
    # REFRESH THE LIST

    def refresh_content
      @billers = Biller.all
      @debtors = Debtor.all
      @items = Item.all
      @descriptions = Description.all
      @bank_details = BankDetail.all

      respond_to do |format|
        format.html { redirect_to account_settings_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------

  end
end