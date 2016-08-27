class MonthlyRanking < ApplicationRecord
  validates :employee_id, presence: true

  belongs_to :employee, class_name: :Employee, foreign_key: "employee_id"
end