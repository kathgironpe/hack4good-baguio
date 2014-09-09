require 'rails_helper'

feature 'Manage Challenge Partner' do
  let(:admin) { create(:user, admin: true) }
  let(:user) { create(:user, admin: false) }

  scenario 'Admin creates a new challenge partner' do
    sign_in(admin)
    expect(page).to have_content('Challenge Partners')
    click_link 'Challenge Partners'
    click_link 'New Challenge Partner'
    fill_in 'challenge_partner[name]', with: 'Organization name'
    fill_in 'challenge_partner[description]', with: 'Organization description'
    click_button 'Create Challenge Partner'
    expect(page).to have_content('Edit')
  end

  scenario 'User creates a new challenge partner' do
    sign_in(user)
    expect(page).to have_content('Challenge Partners')
    click_link 'Challenge Partners'
    expect(page).to_not have_content('New Challenge Partner')
  end
end
