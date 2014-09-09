module Features
  # Helpers for testing sign in, sign up and sign out
  module SessionHelpers
    def sign_up(user)
      visit sign_up_path
      fill_in 'user_username', with: user.username
      fill_in 'user_first_name', with: user.first_name
      fill_in 'user_last_name', with: user.last_name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign up'
    end

    def sign_in(user)
      visit sign_in_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
    end

    def sign_out(user)
      logout(user)
    end
  end
end
