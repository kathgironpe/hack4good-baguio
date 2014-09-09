class ChallengePolicy
  attr_reader :user, :challenge

  def initialize(user, challenge)
    @user = user
    @challenge = challenge
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
