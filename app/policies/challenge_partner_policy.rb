class ChallengePartnerPolicy
  attr_reader :user, :challenge_partner

  def initialize(user, challenge_partner)
    @user = user
    @challenge_partner = challenge_partner
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
