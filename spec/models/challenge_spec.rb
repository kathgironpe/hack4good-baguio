require 'rails_helper'

describe Challenge do
  it { should belong_to(:challenge_partner) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:challenge_partner_id) }
  it { should validate_presence_of(:user_id) }
end
