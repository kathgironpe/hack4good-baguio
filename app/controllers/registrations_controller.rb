class RegistrationsController < Devise::RegistrationsController
  def update
    account_update_params = update_account_params
    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      sign_in @user, bypass: true
      redirect_to after_update_path_for(@user)
    else
      render 'edit'
    end
  end

  private

  def update_account_params
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    account_update_params.tap do |aup|
      if aup[:password].blank?
        aup.delete('password')
        aup.delete('password_confirmation')
      end
    end
  end
end
