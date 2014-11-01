module Account

  class LogosController < ApplicationController

    # -----------------------------------------------
    # CREATE
    def new
      @logo = Logo.new
    end

    def create
      @logo = Logo.new(logo_params)

      if @logo.save
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
      end
    end
    # -----------------------------------------------
    # UPDATE
    def edit
      @logo = Logo.find params[:id]
      params[:id_name] = 'Logo'
    end

    def update
      @logo = Logo.find params[:id]
      if @logo.update_attributes logo_params
        respond_to do |format|
          format.html {redirect_to account_settings_path}
          format.js
        end
      end
    end
    # -----------------------------------------------
    # DELETE
    def delete
      @logo = Logo.find params[:id]
    end

    def destroy
      @logo = Logo.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to account_settings_path }
        format.js
      end
    end
    # -----------------------------------------------

    def get_json_photos
      # assign the response by calling the helper method, passing in the photoset id
      @photos = view_context.get_flickr_pics(params[:photoset_id])
      render :text => @photos.to_json
    end

    # -----------------------------------------------
    def logo_params

      params.require(:logo).permit(
          :name,
          :image_id,
          :image_url,
          :image_size
      )
    end
  end
  # -----------------------------------------------

end