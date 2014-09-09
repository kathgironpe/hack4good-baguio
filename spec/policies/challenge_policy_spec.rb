require 'rails_helper'

describe ChallengePolicy do
  subject { ChallengePolicy }

  let(:user) { User.new(admin: false) }
  let(:admin_user) { User.new(admin: true) }

  permissions :update? do
    it 'denies access if user is not an admin' do
      expect(subject).not_to permit(user, Challenge.new)
    end

    it 'grants access if user is an admin' do
      expect(subject).to permit(admin_user, Challenge.new)
    end
  end

  permissions :create? do
    it 'denies access if user is not an admin' do
      expect(subject).not_to permit(user, Challenge.new)
    end

    it 'grants access if user is an admin' do
      expect(subject).to permit(admin_user, Challenge.new)
    end
  end

  permissions :destroy? do
    it 'denies access if user is not an admin' do
      expect(subject).not_to permit(user, Challenge.new)
    end

    it 'grants access if user is an admin' do
      expect(subject).to permit(admin_user, Challenge.new)
    end
  end
end
