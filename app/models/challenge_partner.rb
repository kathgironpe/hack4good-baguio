class ChallengePartner < ActiveRecord::Base
  has_many :challenges

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
