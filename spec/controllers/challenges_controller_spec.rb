require 'rails_helper'

describe ChallengesController do
  let(:challenge) { create(:challenge) }

  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#show' do
    it 'returns http success' do
      get :show, id: challenge
      expect(response).to be_success
    end
  end
end
