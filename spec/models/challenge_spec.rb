require 'rails_helper'

describe Challenge do
  it { should belong_to(:challenge_partner) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:challenge_partner_id) }
  it { should validate_presence_of(:user_id) }

  describe '.search' do
    let!(:challenge) do
      create(:challenge, title: 'Save the Children', description: 'From destructive consumerism')
    end

    context 'when the search critera matches title or description' do
      it 'returns a result' do
        expect(Challenge.search('Save').count).to eq(1)
      end
    end

    context 'when the search critera matches title or description' do
      it 'returns no results' do
        expect(Challenge.search('trees').count).to eq(0)
      end
    end

    context 'when the valid search criteria has html' do
      let(:text) { '<strong>children</strong>' }

      it 'sanitizes search text and returns a result' do
        expect(Challenge.search(text).count).to eq(1)
      end
    end
  end
end
