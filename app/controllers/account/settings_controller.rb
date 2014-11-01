module Account

  class SettingsController < ApplicationController

    layout 'cerulean'

    def index
      @billers = Biller.all
      @debtors = Debtor.all
      @items = Item.all
      @descriptions = Description.all
      @bank_details = BankDetail.all
      @logos = Logo.all

    end

    # -------------------------------------------------------------------------
    # REFRESH THE LIST

    def refresh_content
      @billers = Biller.all
      @debtors = Debtor.all
      @items = Item.all
      @descriptions = Description.all
      @bank_details = BankDetail.all
      @logos = Logo.all

      respond_to do |format|
        format.html { redirect_to account_settings_path }
        format.js
      end
    end

    # -------------------------------------------------------------------------

  end
end