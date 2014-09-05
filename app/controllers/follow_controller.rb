class FollowController < ApplicationController


  def contact

    @contact = Contact.new

  end

  def create_contact

    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = 'Message sent'
    else
      render('contact')
    end

  end

  def contact_params

    params.require(:contact).permit(
        :message,
        :name,
        :email
    )
  end

  def get_twitter_data

    # assign the response by calling the helper method
    @twitter_data = view_context.get_twitter_feed()
    render :text => @twitter_data.to_json

  end

end
