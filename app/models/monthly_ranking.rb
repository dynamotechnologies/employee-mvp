class MonthlyRanking < ApplicationRecord
  validates :employee_id, presence: true

  belongs_to :employee, class_name: :Employee, foreign_key: "employee_id"

  scope :by_month, -> (month = Date.today.month, year = Date.today.year) {where('month = ? and year = ?', month, year)}
end