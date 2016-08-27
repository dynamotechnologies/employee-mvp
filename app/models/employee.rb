class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :kudo_transactions, dependent: :destroy
  has_many :monthly_rankings, dependent: :destroy

  def fullname
    [self.first_name, self.last_name].join(' ')
  end

  def deduct_kudos(amount)
    self.kudo_balance -= amount
    self
  end

  def add_kudos(amount)
    self.kudos_received += amount
    self
  end

  def kudo_transactions_for_month(datetime = DateTime.current)
    KudoTransaction.created_between(datetime.beginning_of_month, datetime.end_of_month).for_receiver(self.id).order(created_at: :desc)
  end

  def current_rank
    self.monthly_rankings.find {|ranking| ranking.month == Date.today().month }.try(:rank)
  end

  scope :active, -> { where(is_active: true) }
  scope :for_leaderboard, ->(limit=5) { order(kudos_received: :desc).active.limit(limit) }
  scope :leader_this_month, ->(limit=1) do
    Employee.where(id: KudoTransaction.max_receiver_for_month(DateTime.current, limit).map(&:to_id))
  end
  scope :leader_last_month, ->(limit=1) do
    Employee.where(id: KudoTransaction.max_receiver_for_month(DateTime.current - 1.month, limit).map(&:to_id))
  end
end
