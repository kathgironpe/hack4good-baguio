require 'rails_helper'

feature 'Manage Challenge' do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:challenge_partner) { create(:challenge_partner) }

  scenario 'Admin creates a new challenge' do
    sign_in(admin)
    expect(page).to have_content('Challenge Partners')
    click_link 'Challenges'
    expect(page).to have_content('New Challenge')
    click_link 'New Challenge'
    select challenge_partner.name, from: 'challenge_challenge_partner_id'
    fill_in 'challenge_title', with: 'Title'
    fill_in 'challenge_description', with: 'Description'
    click_button 'Create Challenge'
    expect(page).to have_content('Description')
  end

  scenario 'User creates a new challenge partner' do
    sign_in(user)
    expect(page).to have_content('Challenges')
    click_link 'Challenges'
    expect(page).to_not have_content('New Challenge')
  end
end
