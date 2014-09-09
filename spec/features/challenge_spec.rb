require 'rails_helper'

feature 'Manage Challenge' do
  let(:admin) { create(:user, admin: true) }
  let(:user) { create(:user, admin: false) }
  let(:challenge_partner) { create(:challenger_partner) }

  scenario 'Admin creates a new challenge' do
    sign_in(admin)
    expect(page).to have_content('Challenge Partners')
    click_link 'Challenges'
    click_link 'New Challenge'
    fill_in 'challenge_challenger_partner_id', with: challenge_partner.id
    fill_in 'challenge_title', with: 'Title'
    fill_in 'challenge_description', with: 'Description'
    click_button 'Create Challenge'
    expect(page).to have_content('Edit')
  end

  scenario 'User creates a new challenge partner' do
    sign_in(user)
    expect(page).to have_content('Challenges')
    click_link 'Challenges'
    expect(page).to_not have_content('New Challenge')
  end
end
