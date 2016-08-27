class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :kudo_transactions, dependent: :destroy

  def fullname
    [self.first_name, self.last_name].join(' ')
  end

  scope :active, -> { where(is_active: true) }
  scope :for_leaderboard, ->(limit=5) { order(kudos_received: :desc).active.limit(limit) }
  scope :leader_this_month, -> do
    Employee.where(id: KudoTransaction.max_receiver_for_month(DateTime.current).map(&:to_id))
  end
  scope :leader_last_month, -> do
    Employee.where(id: KudoTransaction.max_receiver_for_month(DateTime.current - 1.month).map(&:to_id))
  end
end
