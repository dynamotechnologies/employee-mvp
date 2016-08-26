class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :active, -> { where(is_active: true) }
  scope :for_leaderboard, -> { order("kudos_received desc").limit(5).active }
end
