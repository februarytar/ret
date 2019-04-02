class RegistrationsController < ApplicationController

    private
  
    def sign_up_params
      params.require(:user).permit( :name,
                                    :alamat 
                                    :email, 
                                    :password, 
                                    :password_confirmation)
    end
  
    def edit_user
      params.require(:user).permit( :name,
                                    :alamat 
                                    :email, 
                                    :password, 
                                    :password_confirmation, 
                                    :current_password)
    end

end