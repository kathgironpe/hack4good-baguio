require 'rails_helper'

feature 'Sign in' do
  let(:user) { build(:user) }
  let(:existing_user) { create(:user) }
  scenario 'User is not registered and enters correct details' do
    sign_up(user)
    sign_in(user)
    sign_out(user)
  end

  scenario 'User is not registered and enters invalid email' do
    sign_up(build(:user, email: 'emailwrong'))
    expect(page).to have_content('Emailis invalid')
  end

  scenario 'User is registered' do
    create(:user)
    sign_up(user)
  end
end
