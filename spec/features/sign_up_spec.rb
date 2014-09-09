require 'rails_helper'

feature 'Sign up' do
  let(:user) { build(:user) }
  let(:existing_user) { create(:user) }

  before do
    User.delete_all
  end

  scenario 'User is not registered' do
    sign_up(user)
    expect(page).to have_content('Sign in')
    sign_in(user)
  end

  scenario 'User is registered' do
    sign_up(existing_user)
    expect(page).to have_content('has already been taken')
  end
end
