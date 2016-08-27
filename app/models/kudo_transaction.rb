class KudoTransaction < ApplicationRecord
  validates :amount, presence: true
  validates :from_id, presence: true
  validates :to_id, presence: true
  validate  :from_user_must_have_enough_kudos

  private 
    def from_user_must_have_enough_kudos
      e = Employee.find self.from_id
      errors.add(:amount, "is more than kudos remaining") if e.kudo_balance < self.amount
    end
end
