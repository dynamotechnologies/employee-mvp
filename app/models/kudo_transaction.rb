class KudoTransaction < ApplicationRecord
  validates :amount, presence: true
  validates :from_id, presence: true
  validates :to_id, presence: true
  validates :reason, length: {maximum: 256}

  belongs_to :from, class_name: :Employee, foreign_key: "from_id"
  belongs_to :to, class_name: :Employee, foreign_key: "to_id"

  def give_kudos
    transaction do
      self.save!
      from.deduct_kudos(self.amount).save!
      to.add_kudos(self.amount).save!
    end
  end

  scope :for_receiver, ->(user_id) { where(to_id: user_id) }
  scope :created_between, ->(start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date) }
  scope :max_receiver_for_month, ->(datetime, limit=1) do
    created_between(datetime.beginning_of_month, datetime.end_of_month)
        .select("kudo_transactions.to_id, sum(kudo_transactions.amount) as month_total")
        .group("kudo_transactions.to_id")
        .order("month_total desc").limit(limit)
  end

end
