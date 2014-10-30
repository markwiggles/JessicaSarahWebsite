module Account

  class DescriptionsController < ApplicationController

    # -----------------------------------------------
    # CREATE
    def new
      @description = Description.new
    end

    def create
      @description = Description.new(description_params)

      if @description.save
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
      end
    end
    # -----------------------------------------------
    # UPDATE
    def edit
      @description = Description.find params[:id]
    end

    def update
      @description = Description.find params[:id]
      if @description.update_attributes description_params
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
      end
    end
    # -----------------------------------------------
    # DELETE
    def delete
      @description = Description.find params[:id]
    end

    def destroy
      @description = Description.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to account_settings_path }
        format.js
      end
    end

    # -----------------------------------------------
    def description_params

      params.require(:description).permit(
          :text
      )
    end
  end
  # -----------------------------------------------

end