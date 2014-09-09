class User < ActiveRecord::Base
  has_many :challenges

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  extend FriendlyId
  friendly_id :username, use: :slugged

  def name
    [first_name, last_name].join(' ')
  end
end
