class ChallengePartnerPolicy
  attr_reader :user, :challenge_partner

  def initialize(user, challenge_partner)
    @user = user
    @challenge_partner = challenge_partner
  end

  def create?
    user && user.admin?
  end

  def update?
    user && user.admin?
  end

  def destroy?
    user && user.admin?
  end
end
