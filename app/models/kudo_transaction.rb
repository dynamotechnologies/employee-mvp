class KudoTransaction < ApplicationRecord
  validates :amount, presence: true
  validates :from_id, presence: true
  validates :to_id, presence: true
  validate  :from_user_must_have_enough_kudos

  belongs_to :from, class_name: :Employee, foreign_key: "from_id"
  belongs_to :to, class_name: :Employee, foreign_key: "to_id"

  def give_kudos
    amount = self.amount
    
    transaction do
      from.kudo_balance -= amount
      from.save!

      to.kudos_received += amount
      to.save!

      self.save!
    end
  end

  scope :created_between, ->(start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date )}
  scope :max_receiver_for_month, ->(datetime, limit=1) do
    created_between(datetime.beginning_of_month, datetime.end_of_month)
      .select("kudo_transactions.to_id, sum(kudo_transactions.amount) as sum_amounts")
      .group("kudo_transactions.to_id")
      .order("sum_amounts desc").limit(limit)
  end

  private 
    def from_user_must_have_enough_kudos
      e = Employee.find self.from_id
      errors.add(:amount, "is more than kudos remaining") if e.kudo_balance < self.amount
    end
end
