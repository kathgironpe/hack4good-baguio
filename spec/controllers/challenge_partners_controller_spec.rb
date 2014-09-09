require 'rails_helper'

describe ChallengePartnersController do
  let(:challenge_partner) { create(:challenge_partner) }

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#show' do
    it 'returns http success' do
      get :show, id: challenge_partner
      expect(response).to be_success
    end
  end
end
