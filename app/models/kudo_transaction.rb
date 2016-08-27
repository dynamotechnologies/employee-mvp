class KudoTransaction < ApplicationRecord
  validates :amount, presence: true
  validates :from_id, presence: true
  validates :to_id, presence: true
  validates :reason, length: { maximum: 256 }
  validate  :from_user_must_have_enough_kudos

  belongs_to :from, class_name: :Employee, foreign_key: "from_id"
  belongs_to :to, class_name: :Employee, foreign_key: "to_id"

  def give_kudos
    transaction do
      from.deduct_kudos(self.amount).save!
      to.add_kudos(self.amount).save!
      self.save!
    end
  end

  scope :for_receiver, ->(user_id) { where(to_id: user_id) }
  scope :created_between, ->(start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date )}
  scope :max_receiver_for_month, ->(datetime, limit=1) do
    created_between(datetime.beginning_of_month, datetime.end_of_month)
      .select("kudo_transactions.to_id, sum(kudo_transactions.amount) as month_total")
      .group("kudo_transactions.to_id")
      .order("month_total desc").limit(limit)
  end

  private
    def from_user_must_have_enough_kudos
      e = Employee.find self.from_id
      errors.add(:amount, "is more than kudos remaining") if e.kudo_balance < 0
    end
end
