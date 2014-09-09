class RegistrationsController < Devise::RegistrationsController

  layout 'admin'


  private

  def sign_up_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
  end


end
